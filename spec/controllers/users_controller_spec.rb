require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  #show
  describe "users#show action" do
    it "should successfully show the user page" do
      user = FactoryBot.create(:user)
      sign_in user 
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the user page is not found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: { id: 'TACOCAT' }
      expect(response).to have_http_status(:not_found)

    end
  end



end
