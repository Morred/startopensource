class Project < ActiveRecord::Base
  validates :name, :url, :language, :description, presence: true
end
