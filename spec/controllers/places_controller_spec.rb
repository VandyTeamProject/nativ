require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  
  #index 
  describe "places#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)

    end
  end

  #new
  describe "places#new action" do

    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do
      user = FactoryBot.create(:user)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)

    end
  end

   #create
  describe "grams#create action" do
    
    it "should require users to be logged in" do
      post :create, params: { place: { name: "Hello" } }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a new gram in our database" do
      user = FactoryBot.create(:user)
      sign_in user

       post :create, params: {
        place: {
        name: 'Hello!',
        description: 'Hello!',
        address:'Hello!'
        }
       }

      place = Place.last
      expect(place.name).to eq("Hello!")
      expect(place.description).to eq("Hello!")
      expect(place.address).to eq("Hello!")
      expect(place.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { place: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Place.count).to eq 0
      end
  end

  #edit
  describe "grams#edit action" do
    it "shouldn't let a user who did not create the place edit a place" do
      place = FactoryBot.create(:place)
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: { id: place.id }
      expect(response).to have_http_status(:forbidden)
      end

    it "shouldn't let unauthenticated users destroy a place" do
      place = FactoryBot.create(:place)
      delete :destroy, params: { id: place.id }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the edit form if the place is found" do
      place = FactoryBot.create(:place)
      sign_in place.user
      get :edit, params: { id: place.id }
      expect(response).to have_http_status(:success)

    end

    it "should return a 404 error message if the place is not found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: { id: 'SWAG' }
     expect(response).to have_http_status(:not_found)

    end
  end


   #show
  describe "places#show action" do
    it "should successfully show the page if the place is found" do
      place = FactoryBot.create(:place)
      get :show, params: { id: place.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the place is not found" do
      get :show, params: { id: 'TACOCAT' }
      expect(response).to have_http_status(:not_found)

    end
  end

end
