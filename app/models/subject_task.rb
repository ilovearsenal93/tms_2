class SubjectTask < ActiveRecord::Base
  belongs_to :subject
  belongs_to :task
  validates :subject_id, presence:true
  validates :task_id, presence: true
end
