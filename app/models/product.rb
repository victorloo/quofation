class Product < ApplicationRecord
  belongs_to :designer, class_name: "designer_id"
  has_many :fitting_photos

end
