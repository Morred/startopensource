class ProjectsController < ApplicationController
  def index
    @projects = Project.search(params[:language])
    @search_language = params[:language].capitalize
  end

  def show
    @project = Project.find(params[:id])
    @issues = @project.issues
  end
end
