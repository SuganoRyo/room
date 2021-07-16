class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  has_many :reservers
  has_many :greenhouses
  
  validates :nickname, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, length: { minimum: 6 }
end
