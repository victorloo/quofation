class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def item_total
    self.quantity * self.product.price
  end

  SHIPPING_STATUS = [
    ["Not Shipped", :not_shipped],
    ["Shipped",:shipped]
  ]
  
end
