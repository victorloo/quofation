class Product < ApplicationRecord
  mount_uploader :image, ProductUploader
  validates_presence_of :name, :color, :size, :description, :inventory, :category, :price
  belongs_to :designer
  belongs_to :category, optional: true
  belongs_to :size, optional: true
  belongs_to :color, optional: true
  belongs_to :inventory, optional: true
  has_many :chat_rooms, dependent: :destroy
  has_many :chat_room_users, through: :chatrooms
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

end
