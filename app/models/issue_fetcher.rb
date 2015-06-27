class IssueFetcher

  def fetch_issues()
    HTTParty.get('https://api.github.com/search/issues?q=repo:intridea/grape+state:open+label:discuss!')
  end

end