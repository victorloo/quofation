class Product < ApplicationRecord
  mount_uploader :image, ProductUploader
  validates_presence_of :name
  belongs_to :designer
  has_many :fitting_photos
  belongs_to :category, optional: true


  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
end
