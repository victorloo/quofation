class Designer < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_many :products
  #掛載uploader
  mount_uploader :image, DesignerPhotoUploader
end
