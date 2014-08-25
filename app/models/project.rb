class Project < ActiveRecord::Base
  validates :name, :url, :description, presence: true

  has_many :project_languages
  has_many :languages, through: :project_languages
  has_many :issues

end
