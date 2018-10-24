class AmendShippingStatusToOrderItem < ActiveRecord::Migration[5.2]
  def up
    remove_column :orders, :shipping_status
    add_column :orders, :shipping_count, :integer, default: 0
    add_column :order_items, :shipping_status, :string, default: "not_shipped"
  end

  def down
    add_column :orders, :shipping_status, :string, default: "not_shipped"
    remove_column :orders, :shipping_count
    remove_column :order_items, :shipping_status
  end
end
