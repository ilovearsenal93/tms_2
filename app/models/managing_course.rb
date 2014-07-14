class ManagingCourse < ActiveRecord::Base
  belongs_to :supervisor
  belongs_to :course
  validates :supervisor_id, presence: true
  validates :course_id, presence:true
end
