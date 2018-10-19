class AmendItemsTable < ActiveRecord::Migration[5.2]
  def change
    # cart_items
    add_column :cart_items, :size_name, :string
    add_column :cart_items, :color_id, :integer
    add_column :cart_items, :color_name, :string
    add_column :cart_items, :inventory_id, :integer

    # order_items
    add_column :order_items, :size_name, :string
    add_column :order_items, :color_name, :string
  end
end
