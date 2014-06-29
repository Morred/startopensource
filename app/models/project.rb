class Project < ActiveRecord::Base
  validates :name, :url, :description, presence: true

  has_many :project_languages
  has_many :languages, through: :project_languages

  def self.search(search_params)
    # implement proper search -> check if search_params in languages!
    if search_params
      search_params.downcase!
      projects = Project.where("language = ?", "#{search_params}")
    else
      projects = Project.all
    end
  end
end
