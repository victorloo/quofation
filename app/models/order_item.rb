class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :color

  def item_total
    self.quantity * self.product.price
  end
end
