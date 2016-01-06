class Issue < ActiveRecord::Base
  validates :project_id, :title, presence: true

  belongs_to :project

  def self.search(search_language)
    Language.all.pluck(:name).include?(search_language)
    language = Language.where(name: search_language)
    project_ids = ProjectLanguage.where(language: language).pluck(:project_id)
    issues = Issue.where(project_id: project_ids)
  end

end
