class ChangeFKtoTableProductandDesigner < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :user_id
    add_column :products, :designer_id, :integer
    add_column :designers, :user_id, :integer
  end
end
