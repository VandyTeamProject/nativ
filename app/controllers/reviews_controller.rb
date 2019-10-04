class ReviewsController < ApplicationController
  before_action :authenticate_user!


  def create
    @place = Place.find(params[:place_id])
    @place.reviews.create(review_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

    private

  def review_params
    params.require(:review).permit(:rating, :message)
  end

end
