class User < ApplicationRecord
	validates :name, presence: true
	#A regular Expression for email validation.
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence: true, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 4}
	has_and_belongs_to_many :courses
end
