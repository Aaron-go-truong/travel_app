require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let!(:user) { create(:user) }
  let(:plan) { create(:plan) }
  let(:comment) { create(:comment, plan_id: plan.id) }

  before do
    sign_in user
  end

  describe 'POST #create' do

    def do_request
      post :create, params: { plan_id: plan.id, like: like_params, user_id: user.id }
    end

    context 'like comment' do
      let(:like_params) {{ likeable_id: comment.id, likeable_type: comment.class.name }}
      it do
        expect { do_request }.to change(comment.likes.all, :count).by(1)
        expect(response).to redirect_to(plan_path(plan))
      end
    end

    context 'like plan' do
      let(:like_params) {{ likeable_id: plan.id, likeable_type: plan.class.name }}
      it do
        expect { do_request }.to change(plan.likes.all, :count).by(1)
        expect(response).to redirect_to(plan_path(plan))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'delete like comment' do
      let(:like_params) {{ likeable_id: comment.id, likeable_type: comment.class.name }}
      it do
        like = create(:like, likeable_id: comment.id, likeable_type: comment.class.name, user_id: user.id)
        delete :destroy, params: { user_id: user.id, like: like_params, plan_id: plan.id }

        expect(assigns(:like)).to eq(like)
        expect(assigns(:like)).to be_destroyed
        expect(response).to redirect_to(plan_path(plan))
      end
    end

    context 'delete like plan' do
      let(:like_params) {{ likeable_id: plan.id, likeable_type: plan.class.name }}
      it do
        like = create(:like, likeable_id: plan.id, likeable_type: plan.class.name, user_id: user.id)
        delete :destroy, params: { user_id: user.id, like: like_params, plan_id: plan.id }

        expect(assigns(:like)).to eq(like)
        expect(assigns(:like)).to be_destroyed
        expect(response).to redirect_to(plan_path(plan))
      end
    end
  end
end
