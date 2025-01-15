class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @id = params[:id]
    @restaurant = Restaurant.find(@id)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
  end

  private

  def form_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
