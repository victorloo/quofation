class ChatRoom < ApplicationRecord
  belongs_to :fitting_photo
  has_many :messages, dependent: :destroy
end
