class AmendAttributesToItems < ActiveRecord::Migration[5.2]
  def up
    # Inventory
    remove_column :inventories, :name
    add_column :inventories, :amount, :integer, default: 0
    add_column :inventories, :product_id, :integer
    add_column :inventories, :color_id, :integer
    add_column :inventories, :size_id, :integer
    add_column :inventories, :color_name, :string
    add_column :inventories, :size_name, :string

    # Product
    remove_column :products, :size_id
    remove_column :products, :color_id
    remove_column :products, :inventory_id

    # CartItems
    add_column :cart_items, :size_name, :string
    add_column :cart_items, :color_id, :integer
    add_column :cart_items, :color_name, :string
    add_column :cart_items, :inventory_id, :integer

    # OrderItems
    add_column :order_items, :size_name, :string
    add_column :order_items, :color_name, :string
  end

  def down
    # Inventory
    add_column :inventories, :name, :string
    remove_column :inventories, :amount
    remove_column :inventories, :product_id
    remove_column :inventories, :color_id
    remove_column :inventories, :size_id
    remove_column :inventories, :color_name
    remove_column :inventories, :size_name

    # Product
    add_column :products, :size_id, :integer
    add_column :products, :color_id, :integer
    add_column :products, :inventory_id, :integer

    # CartItems
    remove_column :cart_items, :size_name
    remove_column :cart_items, :color_id
    remove_column :cart_items, :color_name
    remove_column :cart_items, :inventory_id

    # OrderItems
    remove_column :order_items, :size_name
    remove_column :order_items, :color_name
  end
end
