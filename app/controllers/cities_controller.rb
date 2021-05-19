class CitiesController < ApplicationController
  before_action :set_city, only: %i[show edit update destroy]

  def index
    @cities = policy_scope(City)
  end

  def show
  end

  def new
    @city = City.new
    authorize @city
  end

  def create
    @city = City.new(city_params)
    authorize @city
    @user = current_user
    @city.user = @user
    if @city.save
      redirect_to city_path(@city)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @city.update(city_params)
    redirect_to city_path(@city)
  end

  def destroy
    @city.destroy
    redirect_to dashboard_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :country, :price, :main_monument, :user_id, photos: [])
  end

  def set_city
    @city = City.find(params[:id])
    authorize @city
  end
end
