class Post < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  
  validates :post, presence: true
end
