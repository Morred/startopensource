class HomeController < ApplicationController
  def index
    @language_names = Language.all.pluck(:name).sort
  end
end
