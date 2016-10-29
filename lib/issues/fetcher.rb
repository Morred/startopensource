module Issues
  class Fetcher
    def initialize(project)
      @project = project
    end

    def fetch_github_issues
      github = GithubSearch::Searcher.new

      issues_data =
        github.issues.search(repo: @project.path, label: 'startopensource')

      issues_data.each do |issue_data|
        Issues::Creator.create!(
          project: @project,
          title: issue_data.title,
          url: issue_data.html_url,
          body: issue_data.body,
          github_issue_id: issue_data.id
        )
      end
    end
  end
end
