class AddStartDateToTraineeSubject < ActiveRecord::Migration
  def change
    add_column :trainee_subjects, :start_date, :date
  end
end
