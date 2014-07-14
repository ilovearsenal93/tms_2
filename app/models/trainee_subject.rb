class TraineeSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :trainee
  validates :subject_id,presence:true 
  validates :trainee_id,presence:true
  validates :status, presence:true 
end
