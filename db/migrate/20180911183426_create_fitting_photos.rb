class CreateFittingPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :fitting_photos do |t|
      t.string :image
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
