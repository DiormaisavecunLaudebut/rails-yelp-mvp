class RestaurantsController < ApplicationController

  # before_action :find_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(set_params)
    @restaurant.save ? (redirect_to restaurant_path(@restaurant)) : (render :new)
    #   redirect_to restaurant_path(@restaurant)
    # else
    #   render :new
    # end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end


  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(set_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_params
    params.require(:restaurant).permit(:name, :address, :phone, :category)
  end

  # def find_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end
end
