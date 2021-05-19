class City < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :country, presence: true
  validates :price, numericality: { only_integer: true }
  validates :main_monument, presence: true
  has_many_attached :photos
end
