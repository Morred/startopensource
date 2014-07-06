class Issue < ActiveRecord::Base
  validates :project_id, :title, presence: true

  belongs_to :project

end
