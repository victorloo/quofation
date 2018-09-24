class Designer < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :chat_rooms, through: :products
  #掛載uploader
  #mount_uploader :image, DesignerPhotoUploader
end
