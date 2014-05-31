class Project < ActiveRecord::Base
  validates :name, :url, :language, :description, presence: true

  def self.search(search_params)
    puts "I'm here"
    puts search_params
    if search_params
      search_params.downcase!
      projects = Project.where("language LIKE ?", "%#{search_params}%")
    else
      puts "second branch"
      projects = Project.all
    end
end
end
