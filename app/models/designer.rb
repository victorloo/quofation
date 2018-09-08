class Designer < ApplicationRecord
  validates_presence_of :name

  #掛載uploader
  mount_uploader :image, DesignerPhotoUploader
end
