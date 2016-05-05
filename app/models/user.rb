class User < ActiveRecord::Base
  has_secure_password

  has_many :registrations, dependent: :destroy

  def self.authenticate(email_address, password)
    user = User.find_by(email_address: email_address)
    user && user.authenticate(password)
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name, presence: true
  validates :email_address, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, :allow_blank => true

  def gravatar_id
    Digest::MD5::hexdigest(email_address.downcase)
  end

  def admin?
    user_type == 'admin'
  end

end
