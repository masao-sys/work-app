require 'rails_helper'

RSpec.describe 'sale', type: :system do
  let!(:sale_user) { create(:user, :with_sale_profile) }
  let!(:sales) { create_list(:sale, 3, user: sale_user) }

  before do
    sign_in sale_user
  end

  it '全体連絡一覧が表示される' do
    visit sales_path
    sales.each do |sale|
      expect(page).to have_css('.card_title', text: sale.title)
    end
  end

  it '全体連絡の詳細を表示できる' do
    visit sales_path

    sale = sales.last
    page.first('.card_display_button').click

    expect(page).to have_css('.information_title', text: sale.title)
    expect(page).to have_css('.information_content', text: sale.content)
  end
end
