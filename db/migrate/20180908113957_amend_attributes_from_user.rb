class AmendAttributesFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :description
    remove_column :users, :brand
    rename_column :users, :image, :avatar
  end
end
