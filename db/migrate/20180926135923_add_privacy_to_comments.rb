class AddPrivacyToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :privacy, :string, default: :open
  end
end
