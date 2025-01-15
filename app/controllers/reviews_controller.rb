class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(form_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def find_restaurant
    @restaurant_id = params[:restaurant_id]
    @restaurant = Restaurant.find(@restaurant_id)
  end

  def form_params
    params.require(:review).permit(:rating, :content)
  end
end
