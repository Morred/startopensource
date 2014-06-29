class Language < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :project_languages
  has_many :projects, through: :project_languages
end
