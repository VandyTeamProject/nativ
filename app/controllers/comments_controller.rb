class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @place = Place.find_by_id(params[:place_id])
    return render_not_found if @gram.blank?
    @place.comments.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  private

  def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
  end

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
