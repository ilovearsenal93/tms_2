class CreateManagingCourses < ActiveRecord::Migration
  def change
    create_table :managing_courses do |t|
      t.integer :supervisor_id
      t.integer :course_id

      t.timestamps
    end
  end
end
