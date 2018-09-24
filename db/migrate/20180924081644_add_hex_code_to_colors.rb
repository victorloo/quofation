class AddHexCodeToColors < ActiveRecord::Migration[5.2]
  def change
    add_column :colors, :hexcode, :string
  end
end
