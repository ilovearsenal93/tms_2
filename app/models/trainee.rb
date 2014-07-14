class Trainee < ActiveRecord::Base
	has_many :assigned_tasks
	has_many :enrolls
	has_many :trainee_subjects
	before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    length: {maximum:50}
  has_secure_password
  validates :password, length: { minimum: 6 }
end
