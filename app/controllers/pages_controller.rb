class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cities = City.all
  end

  def dashboard
    @bookings = Booking.all
  end
end
