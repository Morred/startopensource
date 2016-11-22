require "rails_helper"

RSpec.describe Issues::Creator, :type => :model do
  let(:project) { FactoryGirl.create(:project) }
  let(:issue_params) do
    {
      project: project,
      title: 'The issue title',
      url: "https://github.com/Morred/github-search/issues/1",
      body: "",
      github_issue_id: '12345'
    }
  end

  before do
    ["ruby", "javascript"].each do |language_name|
      FactoryGirl.create(:language, name: language_name)
    end
  end

  it 'creates an issue' do
    expect { Issues::Creator.create!(issue_params) }
      .to change { Issue.count }.by 1
  end

  context "issue languages" do
    it "does not add languages to the issue if none are specified" do
      issue_params[:body] = ""

      issue = Issues::Creator.create!(issue_params)

      expect(issue.languages.count).to eq 0
    end

    it "correctly parses tagged languages in the first line of the body" do
      issue_params[:body] =
        "#ruby #javascript\r\n\r\nThis is another test issue."

      issue = Issues::Creator.create!(issue_params)

      issue_languages = issue.languages.pluck(:name)
      expect(issue_languages).to include('javascript')
      expect(issue_languages).to include('ruby')
    end

    it "ignores languages that are not known" do
      issue_params[:body] =
        "#ruby #tomatospeak\r\n\r\nThis is another test issue."

      issue = Issues::Creator.create!(issue_params)

      issue_languages = issue.languages.pluck(:name)
      expect(issue_languages).to include('ruby')
      expect(issue_languages).to_not include('tomatospeak')
    end

    it "ignores things in the first line that are not tagged with #" do
      issue_params[:body] =
        "#ruby #javascript something\r\n\r\nThis is another test issue."

      issue = Issues::Creator.create!(issue_params)

      issue_languages = issue.languages.pluck(:name)
      expect(issue_languages).to include('javascript')
      expect(issue_languages).to include('ruby')
      expect(issue_languages).to_not include ('something')
    end

    it "works if there is only one line" do
      issue_params[:body] =
        "#ruby #javascript This is a test issue."

      issue = Issues::Creator.create!(issue_params)

      issue_languages = issue.languages.pluck(:name)
      expect(issue_languages).to include('javascript')
      expect(issue_languages).to include('ruby')
      expect(issue_languages)
        .to_not include('This', 'is', 'a', 'test', 'issue')
    end
  end
end
