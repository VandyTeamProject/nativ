class PlacesController < ApplicationController
    
    def index
        @place = Place.all
    end

    def new
        @place = Place.new
    end

    def create
        Place.create(place_params)
        redirect_to root_path
    end

    def show
        @place = Place.find(params[:id])
    end

private
        
    def place_params
        params.require(:place).permit(:name, :description, :address, phone, hours)
    end


end
