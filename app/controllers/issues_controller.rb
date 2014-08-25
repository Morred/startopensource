class IssuesController < ApplicationController

  def index 
    @issues = Issue.search(params[:language])
    @search_language = params[:language].capitalize
  end
end
