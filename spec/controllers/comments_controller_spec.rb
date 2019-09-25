require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "comments#create action" do
    it "should allow users to create comments on places" do
      place = FactoryBot.create(:place)
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { place_id: place.id, comment: { message: 'awesome gram' } }

      expect(response).to redirect_to place_comment_path
      expect(place.comments.length).to eq 1
      expect(place.comments.first.message).to eq "awesome gram"

    end

    it "should require a user to be logged in to comment on a place" do
        place = FactoryBot.create(:place)
        post :create, params: { place_id: place.id, comment: { message: 'awesome gram' } }
        expect(response).to redirect_to new_user_session_path

    end

    it "should return http status code of not found if the place isn't found" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { place_id: 'YOLOSWAG', comment: { message: 'awesome gram' } }
      expect(response).to have_http_status :not_found

    end
  end
end
