class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :due_date
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :tasks, :projects
  end
end
