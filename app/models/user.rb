class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name,presence: true
  validates :cgpa, presence:true
  validates :password, presence:true, length: { minimum: 8 }
  validates :age, presence:true
   validates :gender, presence:true
  validates :roll_number, presence:true, uniqueness: true
   before_save { self.email = email.downcase }
   before_create :create_remember_token
  has_secure_password
  validates :dp, presence:true
  has_attached_file :dp, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :dp, :content_type => /\Aimage\/.*\Z/
    
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
