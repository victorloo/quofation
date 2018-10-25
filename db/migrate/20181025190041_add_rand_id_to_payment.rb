class AddRandIdToPayment < ActiveRecord::Migration[5.2]
  def up
    add_column :payments, :rand_id, :integer
  end

  def down 
    remove_column :payments, :rand_id
  end
end
