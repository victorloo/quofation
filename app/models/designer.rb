class Designer < ApplicationRecord
  validates_presence_of :name
  has_many :product
  #掛載uploader
  mount_uploader :image, DesignerPhotoUploader
end
