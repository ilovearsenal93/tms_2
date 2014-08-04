class ManagingCourse < ActiveRecord::Base
<<<<<<< HEAD
=======
  has_paper_trail
>>>>>>> 51b2ab65e7ed57a9949315534f448c9958c4b729
  belongs_to :course
  belongs_to :trainee
  validates :supervisor_id, presence: true
  validates :course_id, presence:true
end
