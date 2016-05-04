class Registration < ActiveRecord::Base
  belongs_to :talk

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :last_name, presence: true
  validates :email_address, format: { with: VALID_EMAIL_REGEX }
end
