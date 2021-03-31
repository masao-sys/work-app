require 'rails_helper'

RSpec.describe 'Developments', type: :request do
  let!(:development_user) { create(:user, :with_development_profile) }
  let!(:production_user) { create(:user, :with_production_profile) }
  let!(:developments) { create_list(:development, 3, user: development_user) }

  describe 'GET /developments' do
    context 'ログインしている場合' do
      before do
        sign_in development_user
      end

      it '記事一覧が見れる' do
        get developments_path
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get developments_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /development' do
    context 'ユーザープロフィールがdevelopmentの場合' do
      before do
        sign_in development_user
      end

      it '記事が保存される' do
        development_params = attributes_for(:development)
        post developments_path({development: development_params})
        expect(response).to have_http_status(302)
        expect(Development.last.title).to eq(development_params[:title])
        expect(Development.last.content).to eq(development_params[:content])
      end
    end

    context 'ユーザープロフィールがdevelopmentではない場合' do
      before do
        sign_in production_user
      end

      it 'developmentページに移動する' do
        development_params = attributes_for(:development)
        post developments_path({development: development_params})
        expect(response).to redirect_to(developments_path)
      end
    end
  end
end
