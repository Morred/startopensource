class IssueFetcher

  def fetch_issues
    github = GithubSearch::Searcher.new
    issues = github.issues.search("test", "issue", repo: "Morred/github-search", label: "enhancement")
  end
end