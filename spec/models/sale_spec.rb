require 'rails_helper'

RSpec.describe Sale, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do
    let!(:sale) {build(:sale, user: user)}
    it '記事を保存できる' do
      expect(sale).to be_valid
    end
  end

  context '記事を4枚添付したとき' do
    let!(:sale_four_attach) { build(:sale_four_attach, user: user) }

    before do
      sale_four_attach.save
    end

    it '記事を保存できない' do
      expect(sale_four_attach.errors.messages[:images][0]).to eq('は3つまで指定できます')
    end
  end

  context 'タイトルの入力がない時' do
    let!(:sale) { build(:sale, title: Faker::Lorem.characters(number: 0), user: user) }

    before do
      sale.save
    end

    it '記事を保存できない' do
      expect(sale.errors.messages[:title][0]).to eq('を入力してください')
    end
  end
end
