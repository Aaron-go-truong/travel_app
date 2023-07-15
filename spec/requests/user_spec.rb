require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user){ FactoryBot.create(:user)}

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
      other_user = FactoryBot.create(:user)
      user.follow(other_user)
      expect(user.following).to include(other_user)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #unfollow' do

    it 'remove the followed user from the following list' do
      other_user = FactoryBot.create(:user)
      user.active_relationships.create(followed_id: other_user.id)
      user.unfollow(other_user)
      expect(user.following).not_to include(other_user)
      have_http_status(:success)
    end
  end
end
