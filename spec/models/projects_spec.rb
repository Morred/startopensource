require "rails_helper"

RSpec.describe Project, :type => :model do

  it "returns the correct project path" do
    project = FactoryGirl.create(:project)

    expect(project.path[0]).to_not eq('/')
    expect(project.path).to_not include('http://github.com')
    expect(project.url).to include(project.path)
  end
end