class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :password, presence: true, on: :create
  validates :name, :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts_liked, through: :likes, source: :post

  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end
end
