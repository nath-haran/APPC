class Admin < ActiveRecord::Base
	validates :name, presence: true
	validates :username, presence: true
	validates :email, presence: true
	validates :password, presence: true
	has_secure_password
end
