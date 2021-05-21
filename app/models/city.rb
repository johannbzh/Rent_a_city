class City < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :country, presence: true
  validates :price, numericality: { only_integer: true }, presence: true
  validates :main_monument, presence: true
  has_many_attached :photos
  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?
end
