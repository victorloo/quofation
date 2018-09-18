class CreateColors < ActiveRecord::Migration[5.2]
  def change
    create_table :colors do |t|
      t.string :name

      t.timestamps
    end

    add_column :products, :color_id, :integer
  end
end
