class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cities
  has_many :bookings
  has_many :requests, through: :cities, source: :bookings

  def ordered_requests
    requests.order('created_at DESC')
  end
end
