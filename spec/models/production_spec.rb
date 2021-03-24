require 'rails_helper'

RSpec.describe Production, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do
    let!(:production) {build(:production, user: user)}
    it '記事を保存できる' do
      expect(production).to be_valid
    end
  end

  context '記事を4枚添付したとき' do
    let!(:production_four_attach) { build(:production_four_attach, user: user) }

    before do
      production_four_attach.save
    end

    it '記事を保存できない' do
      expect(production_four_attach.errors.messages[:images][0]).to eq('は3つまで指定できます')
    end
  end

  context 'タイトルの入力がない時' do
    let!(:production) { build(:production, title: Faker::Lorem.characters(number: 0), user: user) }

    before do
      production.save
    end

    it '記事を保存できない' do
      expect(production.errors.messages[:title][0]).to eq('を入力してください')
    end
  end
end
