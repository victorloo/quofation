class CreateSizes < ActiveRecord::Migration[5.2]
   def change
    create_table :sizes do |t|
      t.string :name

      t.timestamps
    end

    add_column :products, :size_id, :integer
  end
end
