class Product < ApplicationRecord
  mount_uploader :image, ProductUploader
  validates_presence_of :name
  belongs_to :designer
  belongs_to :category, optional: true
  has_many :chatrooms, dependent: :destroy
  has_many :chatroom_users, through: :chatrooms
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  
end
