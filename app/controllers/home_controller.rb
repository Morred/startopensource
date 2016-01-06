class HomeController < ApplicationController
  def index
    @languages = Language.all.pluck(:name).sort
  end
end
