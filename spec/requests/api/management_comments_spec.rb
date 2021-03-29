require 'rails_helper'

RSpec.describe 'Api::ManagementComments', type: :request do
  let!(:user) { create(:user) }
  let!(:management_profile) { create(:management_profile, user: user) }
  let!(:management) { create(:management, user: user) }
  let!(:management_comments) { create_list(:management_comment, 3, user: user, management: management) }

  describe 'GET /api/management_comments' do
    before do
      sign_in user
    end

    it '200 Status' do
      get api_management_comments_path(management_id: management.id)
      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)
      expect(body.length).to eq 3
      expect(body[0]['content']).to eq management_comments.first.content
      expect(body[1]['content']).to eq management_comments.second.content
      expect(body[2]['content']).to eq management_comments.third.content
    end
  end
end
