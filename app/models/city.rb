class City < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :country, presence: true
  validates :price, numericality: { only_integer: true }
  validates :main_monument, presence: true
end
