require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user){ create(:user)}
  before_action do
    sign_in user
  end

  describe "GET /index" do
    it "get list users" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
