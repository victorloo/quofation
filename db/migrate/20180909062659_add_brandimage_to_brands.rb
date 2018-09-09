class AddBrandimageToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :brandimage, :string
  end
end
