require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let!(:user) { create(:user, :admin) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'get list users' do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #update_status' do
    it 'change status user' do
      other_user = create(:user)
      put :update_status, params: { id: other_user.id }
      other_user.reload
      expect(other_user.deactivated).to be true
      expect(response).to have_http_status(:success)
    end
  end
end
