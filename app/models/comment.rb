class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  PRIVACY = [
    ['Open', :open],
    ['Privacy', :privacy]
  ]
end