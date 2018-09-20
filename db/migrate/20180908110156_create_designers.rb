class CreateDesigners < ActiveRecord::Migration[5.2]
  def change
    create_table :designers do |t|
      t.string :name
      t.string :brandname
      t.text :description
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
