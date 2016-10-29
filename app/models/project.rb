class Project < ActiveRecord::Base
  validates :name, :url, :description, presence: true

  has_many :project_languages
  has_many :languages, through: :project_languages
  has_many :issues

  def path
    project_path = URI.parse(self.url).path
    project_path.slice!(0) if project_path[0] == "/"
    project_path
  end

end
