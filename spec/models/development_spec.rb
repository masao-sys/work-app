require 'rails_helper'

RSpec.describe Development, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do
    let!(:development) {build(:development, user: user)}
    it '記事を保存できる' do
      expect(development).to be_valid
    end
  end

  context '記事を4枚添付したとき' do
    let!(:development_four_attach) { build(:development_four_attach, user: user) }

    before do
      development_four_attach.save
    end

    it '記事を保存できない' do
      expect(development_four_attach.errors.messages[:images][0]).to eq('は3つまで指定できます')
    end
  end

  context 'タイトルの入力がない時' do
    let!(:development) { build(:development, title: Faker::Lorem.characters(number: 0), user: user) }

    before do
      development.save
    end

    it '記事を保存できない' do
      expect(development.errors.messages[:title][0]).to eq('を入力してください')
    end
  end
end
