require 'rails_helper'

RSpec.describe 'production', type: :system do
  let!(:production_user) { create(:user, :with_production_profile) }
  let!(:productions) { create_list(:production, 3, user: production_user) }

  before do
    sign_in production_user
  end

  it '全体連絡一覧が表示される' do
    visit productions_path
    productions.each do |production|
      expect(page).to have_css('.card_title', text: production.title)
    end
  end

  it '全体連絡の詳細を表示できる' do
    visit productions_path

    production = productions.last
    page.first('.card_display_button').click

    expect(page).to have_css('.information_title', text: production.title)
    expect(page).to have_css('.information_content', text: production.content)
  end
end
