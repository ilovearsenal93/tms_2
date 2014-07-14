class CreateEnrolls < ActiveRecord::Migration
  def change
    create_table :enrolls do |t|
      t.integer :trainee_id
      t.integer :course_id
      t.string :status
      t.timestamp :timecomplete

      t.timestamps
    end
  end
end
