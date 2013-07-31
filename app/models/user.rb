class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, uniqueness: { case_sensitive: false }, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, length: { minimum: 6 }
	has_secure_password
end