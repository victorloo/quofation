class Product < ApplicationRecord
  mount_uploader :image, ProductUploader
  validates_presence_of :name
  belongs_to :designer
  has_many :fitting_photos
  belongs_to :category, optional: true
  belongs_to :size, optional: true
  belongs_to :color, optional: true
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  
end
