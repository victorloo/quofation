class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image
      t.boolean :thirtydays_status
      t.integer :designer_id

      t.timestamps
    end
  end
end
