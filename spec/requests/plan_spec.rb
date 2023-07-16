require 'rails_helper'

RSpec.describe PlansController, type: :controller do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    let!(:plans) { create_list(:plan, 3) }

    it do
      get :index

      expect(response).to render_template(:index)
      expect(assigns(:plans)).to include(*(plans))
      expect(response).to have_http_status(:success)
    end

    context 'filter' do
      it 'assigns the filtered plans if search parameter is provided' do
        plan1 = create(:plan, title: 'Vung Tau Travel')
        plan2 = create(:plan, title: 'Nha Trang Travel')
        get :index, params: { search_content: 'Vung Tau' }

        expect(assigns(:plans)).to eq([plan1])
        expect(response).to have_http_status(:success)
      end

      it 'assigns the filtered plans if page parameter is provided' do
        plan = create(:plan, title: 'Vung Tau Travel')
        user.likes.create(likeable_id: plan.id, likeable_type: "Plan", user_id: user.id)

        get :index, params: { page: 'favourite' }
        expect(assigns(:plans)).to eq([plan])
        expect(response).to have_http_status(:success)
      end

      it 'assigns the filtered plans if user_id parameter is provided' do
        plan1 = create(:plan, title: 'Vung Tau Travel', user_id: user.id)
        plan2 = create(:plan, title: 'Phu Yen Travel', user_id: user.id)

        get :index, params: { user_id: user.id }
        expect(assigns(:plans)).to eq([plan2,plan1])
        expect(response).to have_http_status(:success)
      end

      context "sort" do
        it 'update plans in asc order of creation time' do
          plan1 = create(:plan, title: 'Vung Tau Travel', user_id: user.id)
          plan2 = create(:plan, title: 'Phu Yen Travel', user_id: user.id)

          get :index, params: {user_id: user.id}
          expect(assigns(:plans)).to eq([plan2,plan1])
          expect(response).to have_http_status(:success)
        end

        it 'update plans in descending order of creation time' do
          plan1 = create(:plan, title: 'Vung Tau Travel', user_id: user.id)
          plan2 = create(:plan, title: 'Phu Yen Travel', user_id: user.id)

          get :index, params: { sort_type: 'oldest', user_id: user.id }
          expect(assigns(:plans)).to eq([plan1,plan2])
          expect(response).to have_http_status(:success)
        end

        it 'update plans according to the number of likes' do
          plan1 = create(:plan, title: 'Vung Tau Travel', user_id: user.id)
          plan2 = create(:plan, title: 'Phu Yen Travel', user_id: user.id)
          user.likes.create(likeable_id: plan1.id, likeable_type: "Plan", user_id: user.id)

          get :index, params: { sort_type: 'most_like', user_id: user.id }
          expect(assigns(:plans)).to eq([plan1,plan2])
          expect(response).to have_http_status(:success)
        end
      end
    end
  end

  describe 'GET #new' do
    it do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "POST #create"  do
    def do_request
      post :create, params: { plan: plan_params.merge(user_id: user.id), parent_id: 'value ' }
    end
    context 'valid' do
      let(:plan_params) { attributes_for(:plan) }

      it do
        expect { do_request }.to change(Plan, :count).by(1)
        expect(response).to redirect_to(plan_path(assigns(:plan)))
      end
    end

    context 'invalid' do
      let(:plan_params) { attributes_for(:plan, title: '') }

      it do
        expect { do_request }.not_to change(Plan, :count)
        expect(assigns(:plan).errors).not_to be_empty
      end
    end
  end

  describe 'POST #update' do
    context 'valid' do
      let(:plan_params) { { title: 'updated_title' } }

      it do
        plan = create(:plan, user_id: user.id )
        put :update, params: { id: plan.id, plan: plan_params }
        plan.reload

        expect(assigns(:plan)).to eq(plan)
        expect(assigns(:plan).title).to eq(plan_params[:title])
        expect(response).to redirect_to(plan_path(plan.id))
      end
    end
  end
end
