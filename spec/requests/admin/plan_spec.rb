require 'rails_helper'

RSpec.describe Admin::PlansController, type: :controller do
  let!(:user) { create(:user, :admin) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    let!(:plans) { create_list(:plan, 3) }

    it do
      get :index

      expect(response).to render_template(:index)
      expect(assigns(:plans)).to include(*plans)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #update_status' do
    it 'change status plan' do
      plan = create(:plan)
      put :update_status, params: { id: plan.id }
      plan.reload
      expect(plan.deactivated).to be true
      expect(response).to have_http_status(:success)
    end
  end
end
