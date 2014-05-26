class HomeController < ApplicationController
  def index
    @projects = Project.all.sample(2)
  end
end
