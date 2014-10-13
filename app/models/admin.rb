class Admin < ActiveRecord::Base
	validates :name, presence: true
	validates :username, presence: true
	validates :email, presence: true
	validates :password, presence: true


	def Admin.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Admin.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
