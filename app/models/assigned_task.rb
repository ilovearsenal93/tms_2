class AssignedTask < ActiveRecord::Base
  belongs_to :trainee
  belongs_to :task
  validates :status, presence: true
  validates :trainee_id, presence: true
  validates :task_id, presence: true
end
