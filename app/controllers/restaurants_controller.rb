class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(form_params)
    @restaurant.save
    redirect_to restaurants_path()
  end

  private

  def find_restaurant
    @id = params[:id]
    @restaurant = Restaurant.find(@id)
  end

  def form_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
