require 'rails_helper'

RSpec.describe 'Productions', type: :request do
  let!(:production_user) { create(:user, :with_production_profile) }
  let!(:development_user) { create(:user, :with_development_profile) }
  let!(:productions) { create_list(:production, 3, user: production_user) }

  describe 'GET /productions' do
    context 'ログインしている場合' do
      before do
        sign_in production_user
      end

      it '記事一覧が見れる' do
        get productions_path
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get productions_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /production' do
    context 'ユーザープロフィールがproductionの場合' do
      before do
        sign_in production_user
      end

      it '記事が保存される' do
        production_params = attributes_for(:production)
        post productions_path({production: production_params})
        expect(response).to have_http_status(302)
        expect(Production.last.title).to eq(production_params[:title])
        expect(Production.last.content).to eq(production_params[:content])
      end
    end

    context 'ユーザープロフィールがproductionではない場合' do
      before do
        sign_in development_user
      end

      it 'productionページに移動する' do
        production_params = attributes_for(:production)
        post productions_path({production: production_params})
        expect(response).to redirect_to(productions_path)
      end
    end
  end
end
