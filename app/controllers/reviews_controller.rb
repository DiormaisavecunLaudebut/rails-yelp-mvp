class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(set_params)
    @review.restaurant = @restaurant
    @review.save ? (redirect_to restaurant_path(params[:restaurant_id])) : (render :new)
  end

  private

  def set_params
    params.require(:review).permit(:content, :rating)
  end
end
