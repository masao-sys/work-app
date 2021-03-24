require 'rails_helper'

RSpec.describe Information, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do
    let!(:information) {build(:information, user: user)}
    it '記事を保存できる' do
      expect(information).to be_valid
    end
  end

  context "写真を4枚添付したとき" do
    let!(:information_four_attach) { build(:information_four_attach, user: user) }

    before do
      information_four_attach.save
    end

    it '写真を保存できない' do
      expect(information_four_attach.errors.messages[:images][0]).to eq('は3つまで指定できます')
    end
  end

  context 'タイトルの入力がない時' do
    let!(:information) { build(:information, title: Faker::Lorem.characters(number: 0), user: user) }

    before do
      information.save
    end

    it '記事を保存できない' do
      expect(information.errors.messages[:title][0]).to eq('を入力してください')
    end
  end
end
