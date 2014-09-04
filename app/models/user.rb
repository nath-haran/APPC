class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name,presence: true
  validates :cgpa, presence:true
  validates :password, presence:true, length: { minimum: 8 }
  validates :age, presence:true
  validates :roll_number, presence:true, uniqueness: true
  has_secure_password
end
