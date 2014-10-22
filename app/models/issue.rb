class Issue < ActiveRecord::Base
  validates :project_id, :title, presence: true

  belongs_to :project

  def self.search(search_language)
    if search_language
      search_language.downcase!
      if Language.all.pluck(:name).include?(search_language)
        language = Language.where(name: search_language)
        project_ids = ProjectLanguage.where(language: language).pluck(:project_id)
        issues = Issue.where(project_id: project_ids)
        # TODO - if there are no issues for this language, the user should see a corresponding message and maybe suggestions for other languages 
      else
        # TODO - this shouldn't show all issues. If the language searched for doesn't exist, the user should be redirected to the search form and see a corresponding error message
        issues = Issue.all
      end
    else
      # TODO - this shouldn't show all issues. If there is no search language, the user should be redirected to the search field and see a corresponding error message
      issues = Issue.all
    end
  end

end
