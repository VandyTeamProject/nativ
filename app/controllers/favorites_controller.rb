class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

    respond_to :js

    def favorite 
       @user = current_user
       @place = Place.find(params[:place_id])
       @user.favorite!(@place)
    end

    def unfavorite
       @user = current_user
       @place = @user.favorites.find_by(place_id: params[:place_id])
       @user.unfavorite!(@place)
    end
end
