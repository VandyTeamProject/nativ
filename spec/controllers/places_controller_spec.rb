require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe "places#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)

    end
  end


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

end