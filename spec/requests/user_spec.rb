require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user){ create(:user)}
  let!(:other_user) {create(:user)}

  before do
    sign_in user
  end

  describe "GET /index" do
    it "get list users" do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do

    it 'assigns user and users including followers and following and renders show template' do
      users = user.following | user.followers
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(assigns(:users)).to eq(users)

      expect(response).to render_template(:show)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #follow' do
    it 'add the followed user to the following list' do
      post :follow, params: { id: other_user.id }
      expect(user.following).to include(other_user)
    end
  end

  describe 'DELETE #unfollow' do
    it 'remove the followed user from the following list' do
      user.follow(other_user)
      delete :unfollow, params: { id: other_user.id }
      expect(user.following).not_to include(other_user)
    end
  end
end
