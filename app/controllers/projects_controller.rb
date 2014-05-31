class ProjectsController < ApplicationController
  def index
    @projects = Project.search(params[:language])
  end
end
