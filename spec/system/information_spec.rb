require 'rails_helper'

RSpec.describe 'Information', type: :system do
  let!(:admin) { create(:admin) }
  let!(:informations) { create_list(:information, 3, user: admin) }

  before do
    sign_in admin
  end

  it '全体連絡一覧が表示される' do
    visit root_path
    informations.each do |information|
      expect(page).to have_css('.card_title', text: information.title)
    end
  end

  it '全体連絡の詳細を表示できる' do
    visit root_path

    information = informations.last
    page.first('.card_display_button').click

    expect(page).to have_css('.information_title', text: information.title)
    expect(page).to have_css('.information_content', text: information.content)
  end
end
