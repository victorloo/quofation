class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :color
  belongs_to :inventory

  def item_total
    self.quantity * self.product.price
  end

end
