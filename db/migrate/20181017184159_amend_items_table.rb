class AmendItemsTable < ActiveRecord::Migration[5.2]
  def change
    # cart_items
    add_column :cart_items, :size, :string
    add_column :cart_items, :color_id, :integer
    add_column :cart_items, :inventory_id, :integer

    # order_items
    add_column :order_items, :size, :string
    add_column :order_items, :color_id, :integer
  end
end
