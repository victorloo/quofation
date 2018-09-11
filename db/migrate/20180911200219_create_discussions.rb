class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.text :content
      t.integer :user_id
      t.integer :fitting_photo_id

      t.timestamps
    end
  end
end
