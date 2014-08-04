class CourseSubject < ActiveRecord::Base
  attr_accessor :checked
  belongs_to :course
  belongs_to :subject 
  validates :subject_id,presence:true
  
end
