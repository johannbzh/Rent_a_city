class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
    @city = City.find(params[:city_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.city = City.find(params[:city_id])
    @booking.total_price = @booking.city.price * (@booking[:end_date] - @booking[:start_date]).to_i
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    @booking.total_price = @booking.city.price * (@booking.end_date - @booking.start_date).to_i
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :city_id, :start_date, :end_date, :total_price)
  end
end