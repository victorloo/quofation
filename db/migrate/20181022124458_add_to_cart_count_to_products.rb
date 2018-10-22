class AddToCartCountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :add_to_cart_count, :integer, default: 0
  end
end
