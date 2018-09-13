class Product < ApplicationRecord
  belongs_to :designer
  has_many :fitting_photos

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
end
