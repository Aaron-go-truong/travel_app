require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    let(:plan) { create(:plan) }

    def do_request
      post :create, params: { plan_id: plan.id, comment: comment_params, cmt_parent_id: "value " }
    end

    context 'valid' do
      let(:comment_params) {{ content: 'be updated' }}
      it do
        expect { do_request }.to change(plan.comments.all, :count).by(1)

        expect(response).to redirect_to(plan_path(plan))
        expect(assigns(:comment).content).to eq(comment_params[:content])
      end
    end

    context 'invalid' do
      let(:comment_params) {{ content: '' }}
      it do
        expect { do_request }.not_to change(plan.comments.all, :count)
        expect(response).to redirect_to(plan_path(plan))
      end
    end

    context 'reply' do
      let(:comment) {create(:comment, plan_id: plan.id, user_id: user.id)}
      let(:comment_params) {{ content: 'reply' }}
      it do
        expect {
          post :create, params: { plan_id: plan.id, comment: comment_params, cmt_parent_id: "value #{comment.id}" }
         }.to change(comment.replies.all, :count).by(1)
        expect(response).to redirect_to(plan_path(plan))
      end
    end
  end

  describe 'PUT #update' do
    let!(:plan) { create(:plan) }

    context 'valid' do
      let(:comment_params) {{ content: 'be updated' }}

      it do
        comment = create(:comment, plan_id: plan.id, user_id: user.id)
        put :update, params: { id: comment.id, comment: comment_params, plan_id: plan.id }

        expect(response).to redirect_to(plan_path(plan))
        expect(assigns(:comment)).to eq(comment)
        expect(assigns(:comment).content).to eq(comment_params[:content])
      end
    end

    context 'invalid' do
      let(:comment_params) {{ content: '' }}
      let!(:comment) {create(:comment, plan_id: plan.id, user_id: user.id)}
      it do
        put :update, params: { id: comment.id, comment: comment_params, plan_id: plan.id }
        expect(assigns(:comment).errors).not_to be_empty
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:plan) { create(:plan) }
    let!(:comment) {create(:comment, plan_id: plan.id, user_id: user.id)}
    it do
      delete :destroy, params: { plan_id: plan.id, id: comment.id}

      expect(assigns(:comment)).to eq(comment)
      expect(assigns(:comment)).to be_destroyed
      expect(response).to redirect_to(plan_path(plan))
    end
  end
end
