class FittingPhoto < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :discussions
end
