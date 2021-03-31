require 'rails_helper'

RSpec.describe 'Api::ProductionComments', type: :request do
  let!(:user) { create(:user, :with_production_profile) }
  let!(:production) { create(:production, user: user) }
  let!(:production_comments) { create_list(:production_comment, 3, user: user, production: production) }

  describe 'GET /api/production_comments' do
    before do
      sign_in user
    end

    it '200 Status' do
      get api_production_comments_path(production_id: production.id)
      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)
      expect(body.length).to eq 3
      expect(body[0]['content']).to eq production_comments.first.content
      expect(body[1]['content']).to eq production_comments.second.content
      expect(body[2]['content']).to eq production_comments.third.content
    end
  end
end
