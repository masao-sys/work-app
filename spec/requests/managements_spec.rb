require 'rails_helper'

RSpec.describe 'Managements', type: :request do
  let!(:management_user) { create(:user, :with_management_profile) }
  let!(:sale_user) { create(:user, :with_sale_profile) }
  let!(:managements) { create_list(:management, 3, user: management_user) }

  describe 'GET /managements' do
    context 'ログインしている場合' do
      before do
        sign_in management_user
      end

      it '記事一覧が見れる' do
        get managements_path
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get managements_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /management' do
    context 'ユーザープロフィールがmanagementの場合' do
      before do
        sign_in management_user
      end

      it '記事が保存される' do
        management_params = attributes_for(:management)
        post managements_path({management: management_params})
        expect(response).to have_http_status(302)
        expect(Management.last.title).to eq(management_params[:title])
        expect(Management.last.content).to eq(management_params[:content])
      end
    end

    context 'ユーザープロフィールがmanagementではない場合' do
      before do
        sign_in sale_user
      end

      it 'managementページに移動する' do
        management_params = attributes_for(:management)
        post managements_path({management: management_params})
        expect(response).to redirect_to(managements_path)
      end
    end
  end
end
