class AmendItemsAttributes < ActiveRecord::Migration[5.2]
  def up
    add_column :inventories, :color_name, :string
    add_column :inventories, :size_name, :string
  end

  def down
    remove_column :inventories, :color
    remove_column :inventories, :size
  end
end
