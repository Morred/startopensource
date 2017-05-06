class Issue < ActiveRecord::Base
  validates :project_id, :title, :url, :github_issue_id, presence: true

  belongs_to :project
  has_and_belongs_to_many :languages

  def self.search(search_language)
    language = Language.find_by(name: search_language)
    language.present? ? language.issues : []
  end
end
