class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :language
      t.string :url
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
