class AddSupervisorToTrainee < ActiveRecord::Migration
  def change
    add_column :trainees, :supervisor, :integer, :default => 0
  end
end
