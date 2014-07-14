class AddEndDateToTraineeSubject < ActiveRecord::Migration
  def change
    add_column :trainee_subjects, :end_date, :date
  end
end
