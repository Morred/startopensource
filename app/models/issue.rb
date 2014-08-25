class Issue < ActiveRecord::Base
  validates :project_id, :title, presence: true

  belongs_to :project

  def self.search(search_language)
    if search_language
      search_language.downcase!
      if Language.all.pluck(:name).include?(search_language)
        language = Language.where(name: search_language)
        puts language
        project_ids = ProjectLanguage.where(language: language).pluck(:project_id)
        puts project_ids
        issues = Issue.where(project_id: project_ids)
      else
        issues = Issue.all
      end
    else
      issues = Issue.all
    end
  end

end
