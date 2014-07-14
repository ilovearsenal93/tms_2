class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.integer :subject_id
      t.integer :course_id

      t.timestamps
    end
  end
end
