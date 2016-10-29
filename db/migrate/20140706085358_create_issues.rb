class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :project_id
      t.string :title
      t.string :url
      t.text :body
      t.integer :github_issue_id

      t.timestamps
    end
  end
end
