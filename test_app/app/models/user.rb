class User < ActiveRecord::Base
  attr_accessible :email, :name, :account_name, :password, :password_confirmation
  has_secure_password

  before_save do |user|
    user.email = user.email.downcase
    user.account_name = user.account_name.downcase
  end

  before_save :create_remember_token
  before_create :default_values

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_ACCOUNT_NAME_REGEX = /\A[a-z]+\w*\z/i
  validates :account_name, presence: true,
                    length: { minimum: 5, maximum: 20 },
                    format: { with: VALID_ACCOUNT_NAME_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, if: :password_digest_changed?
  
  def to_param
    self.account_name
  end

  private

  def create_remember_token
    self.remember_token ||= SecureRandom.urlsafe_base64
  end
end
