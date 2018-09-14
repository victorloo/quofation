class Product < ApplicationRecord
  mount_uploader :image, ProductUploader
  validates_presence_of :name
  belongs_to :designer
  has_many :fitting_photos


end
