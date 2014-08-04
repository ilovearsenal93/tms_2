class ManagingCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :trainee
  validates :supervisor_id, presence: true
  validates :course_id, presence:true
end
