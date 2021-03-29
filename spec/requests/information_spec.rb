require 'rails_helper'

RSpec.describe 'Information', type: :request do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:informations) { create_list(:information, 3, user: admin) }

  describe 'GET /information' do
    context 'ログインしている場合' do
      before do
        sign_in admin
      end

      it '記事一覧が見れる' do
        get informations_path
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get informations_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /information' do
    context 'ユーザーが管理者の場合' do
      before do
        sign_in admin
      end

      it '記事が保存される' do
        information_params = attributes_for(:information)
        post informations_path({information: information_params})
        expect(response).to have_http_status(302)
        expect(Information.last.title).to eq(information_params[:title])
        expect(Information.last.content).to eq(information_params[:content])
      end
    end

    context 'ユーザーが管理者ではない場合' do
      before do
        sign_in user
      end

      it 'トップページに移動する' do
        information_params = attributes_for(:information)
        post informations_path({information: information_params})
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
