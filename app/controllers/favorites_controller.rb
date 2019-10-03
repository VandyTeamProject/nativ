class FavoritesController < ApplicationController

    respond_to :js

    def favorite 
        @user = current_user
        @place = Place.find(params[:place_id])
        @user.favorite!(@place)
    end

    def unfavorite
        @user = current_user
        @favorite = @user.favorites.find(params[:place_id])
        @place = Place.find(params[:place_id])
        @favorite.destroy!
    end
end
