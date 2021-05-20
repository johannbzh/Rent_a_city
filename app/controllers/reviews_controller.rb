class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def new
    @review = Review.new
    @city = City.find(params[:city_id])
  end

  def create
    @review = Review.new(review_params)
    @review.city = City.find(params[:city_id])
    @review.user = current_user
    authorize @review
  end

  def edit
  end

  def update
    @review.update(review_params)
    @review.save
    redirect_to city_path(@city)
  end

  def destroy
    @review.destroy
    redirect_to bookings_path
    redirect_to city_path(@city)
  end

  private

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:content, :rating, :user_id)
  end

end
