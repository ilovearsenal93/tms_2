class CreateSubjectTasks < ActiveRecord::Migration
  def change
    create_table :subject_tasks do |t|
      t.integer :subject_id
      t.integer :task_id

      t.timestamps
    end
  end
end
