class Task < ActiveRecord::Base
  has_many :assigned_tasks
  has_many :subject_tasks
  validates :task_description,presence: true
end
