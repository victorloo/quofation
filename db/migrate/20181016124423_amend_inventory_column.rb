class AmendInventoryColumn < ActiveRecord::Migration[5.2]
  def change
    # Inventory
    remove_column :inventories, :name
    add_column :inventories, :amount, :integer, default: 0
    add_column :inventories, :product_id, :integer
    add_column :inventories, :color_id, :integer
    add_column :inventories, :size_id, :integer

    # Product
    remove_column :products, :size_id
    remove_column :products, :color_id
    remove_column :products, :inventory_id
  end
end
