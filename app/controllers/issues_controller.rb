class IssuesController < ApplicationController

  def index
    @issues = Issue.search(params[:language_name])
    @search_language = params[:language_name]
  end
end
