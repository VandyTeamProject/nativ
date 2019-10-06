class ReviewsController < ApplicationController
  before_action :authenticate_user!


  def create
    @place = Place.find_by_id(params[:place_id])
    return render_not_found if @place.blank?
    @place.reviews.create(review_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

    private

  def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
  end

  def review_params
    params.require(:review).permit(:rating, :message)
  end

end
