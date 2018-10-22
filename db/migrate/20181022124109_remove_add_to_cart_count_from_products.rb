class RemoveAddToCartCountFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :add_to_cart_count
  end
end
