require "rails_helper"

RSpec.describe Issues::Fetcher do
  let(:project) do
    FactoryGirl.create(
      :project,
      url: 'https://github.com/Morred/github-search'
    )
  end

  before do
    ["ruby", "javascript"].each do |language_name|
      FactoryGirl.create(:language, name: language_name)
    end
  end

  vcr_options = { cassette_name: 'issues/github_issue_fetching' }
  it 'fetches issues from Github for the given project', vcr: vcr_options do      
    # The result of the actual call to the Github API is
    # recorded in the VCR cassette fixtures/issues/github_issue_fetching.
    # It contains two Github issues.
    expect(Issues::Creator)
      .to receive(:create!)
      .twice

    Issues::Fetcher.new(project).fetch_github_issues
  end
end
