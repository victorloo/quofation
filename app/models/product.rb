class Product < ApplicationRecord
  #mount_uploader :image, ProductUploader
  validates_presence_of :name, :description, :category, :price
  belongs_to :designer
  belongs_to :category, optional: true
  has_many :inventories, dependent: :destroy
  has_many :colors, through: :inventories
  has_many :sizes, through: :inventories 
  has_many :chat_rooms, dependent: :destroy
  has_many :chat_room_users, through: :chatrooms
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

end
