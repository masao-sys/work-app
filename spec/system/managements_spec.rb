require 'rails_helper'

RSpec.describe 'management', type: :system do
  let!(:management_user) { create(:user, :with_management_profile) }
  let!(:managements) { create_list(:management, 3, user: management_user) }

  before do
    sign_in management_user
  end

  it '全体連絡一覧が表示される' do
    visit managements_path
    managements.each do |management|
      expect(page).to have_css('.card_title', text: management.title)
    end
  end

  it '全体連絡の詳細を表示できる' do
    visit managements_path

    management = managements.last
    page.first('.card_display_button').click

    expect(page).to have_css('.information_title', text: management.title)
    expect(page).to have_css('.information_content', text: management.content)
  end
end
