class FittingPhoto < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :discussions
  has_many :chat_rooms, dependent: :destroy
end
