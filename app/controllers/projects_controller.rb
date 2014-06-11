class ProjectsController < ApplicationController
  def index
    @projects = Project.search(params[:language])
    @language = params[:language].capitalize
  end
end
