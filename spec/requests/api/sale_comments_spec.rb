require 'rails_helper'

RSpec.describe 'Api::SaleComments', type: :request do
  let!(:user) { create(:user) }
  let!(:sale_profile) { create(:sale_profile, user: user) }
  let!(:sale) { create(:sale, user: user) }
  let!(:sale_comments) { create_list(:sale_comment, 3, user: user, sale: sale) }

  describe 'GET /api/sale_comments' do
    before do
      sign_in user
    end

    it '200 Status' do
      get api_sale_comments_path(sale_id: sale.id)
      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)
      expect(body.length).to eq 3
      expect(body[0]['content']).to eq sale_comments.first.content
      expect(body[1]['content']).to eq sale_comments.second.content
      expect(body[2]['content']).to eq sale_comments.third.content
    end
  end
end
