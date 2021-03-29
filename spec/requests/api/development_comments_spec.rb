require 'rails_helper'

RSpec.describe 'Api::DevelopmentComments', type: :request do
  let!(:user) { create(:user) }
  let!(:development_profile) { create(:development_profile, user: user) }
  let!(:development) { create(:development, user: user) }
  let!(:development_comments) { create_list(:development_comment, 3, user: user, development: development) }

  describe 'GET /api/development_comments' do
    before do
      sign_in user
    end

    it '200 Status' do
      get api_development_comments_path(development_id: development.id)
      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)
      expect(body.length).to eq 3
      expect(body[0]['content']).to eq development_comments.first.content
      expect(body[1]['content']).to eq development_comments.second.content
      expect(body[2]['content']).to eq development_comments.third.content
    end
  end
end
