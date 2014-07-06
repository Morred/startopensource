class Project < ActiveRecord::Base
  validates :name, :url, :description, presence: true

  has_many :project_languages
  has_many :languages, through: :project_languages
  has_many :issues

  def self.search(search_language)
    if search_language
      search_language.downcase!
      if Language.all.pluck(:name).include?(search_language)
        language = Language.where(name: search_language)
        project_ids = ProjectLanguage.where(language: language).pluck(:project_id)
        projects = Project.where(id: project_ids)
      else
        projects = Project.all
      end
    else
      projects = Project.all
    end
  end
end
