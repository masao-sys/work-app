require 'rails_helper'

RSpec.describe 'Information', type: :system do
  let!(:admin) { create(:admin) }
  let!(:informations) { create_list(:information, 3, user: admin) }

  before do
    sign_in admin
  end

  it '記事一覧が表示される' do
    visit root_path
    informations.each do |information|
      expect(page).to have_content(information.title)
    end
  end
end
