class Reserver < ApplicationRecord
  belongs_to :user
  belongs_to :greenhouse
  
  validates :start, presence: true
  validates :end, presence: true
  validates :number, presence: true
end