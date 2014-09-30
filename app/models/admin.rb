class Admin < ActiveRecord::Base
	validates :name, presence: true
	validates :username, presence: true
	validates :email, presence: true
	validates :password, presence: true
	has_secure_password

	def Admin.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def Admin.digest(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end
end
