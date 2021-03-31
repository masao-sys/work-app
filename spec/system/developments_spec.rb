require 'rails_helper'

RSpec.describe 'development', type: :system do
  let!(:development_user) { create(:user, :with_development_profile) }
  let!(:developments) { create_list(:development, 3, user: development_user) }

  before do
    sign_in development_user
  end

  it '全体連絡一覧が表示される' do
    visit developments_path
    developments.each do |development|
      expect(page).to have_css('.card_title', text: development.title)
    end
  end

  it '全体連絡の詳細を表示できる' do
    visit developments_path

    development = developments.last
    page.first('.card_display_button').click

    expect(page).to have_css('.information_title', text: development.title)
    expect(page).to have_css('.information_content', text: development.content)
  end
end
