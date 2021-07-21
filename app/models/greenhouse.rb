class Greenhouse < ApplicationRecord
has_one_attached :image
belongs_to :user
has_one :reserver

validates :name, presence: true
validates :introduction, presence: true
validates :price, presence: true
validates :address, presence: true
validates :image, presence: true
end
