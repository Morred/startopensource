class CreateIssuesLanguagesJoinTable < ActiveRecord::Migration
  def up
    create_table :issues_languages do |t|
      t.belongs_to :issue, index: true
      t.belongs_to :language, index: true
    end
  end
end
