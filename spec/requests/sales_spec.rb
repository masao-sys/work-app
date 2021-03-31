require 'rails_helper'

RSpec.describe 'Sales', type: :request do
  let!(:sale_user) { create(:user, :with_sale_profile) }
  let!(:production_user) { create(:user, :with_production_profile) }
  let!(:sales) { create_list(:sale, 3, user: sale_user) }

  describe 'GET /sales' do
    context 'ログインしている場合' do
      before do
        sign_in sale_user
      end

      it '記事一覧が見れる' do
        get sales_path
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get sales_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /sale' do
    context 'ユーザープロフィールがsaleの場合' do
      before do
        sign_in sale_user
      end

      it '記事が保存される' do
        sale_params = attributes_for(:sale)
        post sales_path({sale: sale_params})
        expect(response).to have_http_status(302)
        expect(Sale.last.title).to eq(sale_params[:title])
        expect(Sale.last.content).to eq(sale_params[:content])
      end
    end

    context 'ユーザープロフィールがsaleではない場合' do
      before do
        sign_in production_user
      end

      it 'saleページに移動する' do
        sale_params = attributes_for(:sale)
        post sales_path({sale: sale_params})
        expect(response).to redirect_to(sales_path)
      end
    end
  end
end
