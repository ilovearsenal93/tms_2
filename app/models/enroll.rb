class Enroll < ActiveRecord::Base
  belongs_to :trainee
  belongs_to :course
  validates :trainee_id, presence:true
  validates :course_id, presence:true
  validates :status, presence:true
end
