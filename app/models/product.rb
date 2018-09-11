class Product < ApplicationRecord
  belongs_to :designer
  has_many :fitting_photoes
end
