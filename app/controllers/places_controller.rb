class PlacesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @places = Place.all
    end
  
    def new
      @place = Place.new
    end
  
    def create
      @place = current_user.places.create(place_params)
    if @place.valid?
        flash[:success] = "Your place has been added!"
        redirect_to root_path
    else
        flash[:alert] = "Your new place couldn't be created!  Please check the form."
        render :new, status: :unprocessable_entity
    end
    end

    def search
      @place = Place.find_by_id(params[:id])
      @state = State.find_by_id(place_params[:stateId])
      @city = City.find_by_id(params[:cityId])

      if @place = state || @place = city
        return @place
      else
      flash[:alert] = "Be the first to enter a location!"
    end
    end
  
    def show
      @comment = Comment.new
      @place = Place.find_by_id(params[:id])
      return render_not_found if @place.blank?
    end
  
    def edit
      @place = Place.find_by_id(params[:id])
      return render_not_found if @place.blank?
      return render_forbidden if @place.user != current_user
      if @place.user != current_user 
        return render plain: 'Not Allowed', status: :forbidden
      end
    end
  
    
    def update
      @place = Place.find_by_id(params[:id])
      return render_not_found if @place.blank?
      return render_forbidden if @place.user != current_user
      if @place.user != current_user
        return render plain: 'Not Allowed', status: :forbidden
      end
  
      @place.update_attributes(place_params)
      if @place.valid?
        flash[:success] = "Your place has been updated!"
        redirect_to root_path
      else
        flash[:alert] = "Your new place couldn't be updated!  Please check the form."
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @place = Place.find_by_id(params[:id])
      return render_not_found if @place.blank?
      return render_forbidden if @place.user != current_user
      if @place.user != current_user
        return render plain: 'Not Allowed', status: :forbidden
      end
  
      @place.destroy
      redirect_to root_path
    end
  
    private
  
    def place_params
      params.require(:place).permit(:name, :description, :address, :phone_number, :image)
    end

    def render_not_found
    render plain: 'Not Found :(', status: :not_found
    end

    def render_forbidden
    render plain: 'Forbidden', status: :forbidden
    end
  end
