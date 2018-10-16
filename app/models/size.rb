class Size < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories
  has_many :colors, through: :inventories
end
