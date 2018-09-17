class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name

  has_one :designer
  has_many :fitting_photos
  has_many :discussions
  has_many :comments, dependent: :destroy
  has_many :comment_products, through: :comments
  
  def admin?
    self.role == "admin"
  end

end
