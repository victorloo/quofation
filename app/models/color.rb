class Color < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories
  has_many :sizes, through: :inventories
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
end
