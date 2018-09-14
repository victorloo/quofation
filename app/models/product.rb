class Product < ApplicationRecord
  validates_presence_of :name
  belongs_to :designer
  has_many :fitting_photos

end
