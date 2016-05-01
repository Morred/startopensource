class Issue < ActiveRecord::Base
  validates :project_id, :title, :url, presence: true

  belongs_to :project
  has_and_belongs_to_many :languages

  def self.search(search_language)
    language = Language.where(name: search_language)
    project_ids = ProjectLanguage.where(language: language).pluck(:project_id)
    issues = Issue.where(project_id: project_ids)
  end

end
