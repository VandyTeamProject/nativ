class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    if @user.blank?
    render plain: 'Not Found :(', status: :not_found
    end
    current_user.places
  end

end
