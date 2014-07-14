class Course < ActiveRecord::Base
  has_many :enrolls
  has_many :course_subjects
  has_many :managing_courses
  validates :description, presence: true
  validates :course_name, presence: true,length: {maxmimum:70}
end
