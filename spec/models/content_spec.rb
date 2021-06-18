require 'rails_helper'

RSpec.describe Content, type: :model do
  describe '#create' do
    before do
      @content = FactoryBot.create(:content)
    end

    context '金額が登録できる時' do
      it '全てが正しく入力されていたら登録できる' do
        expect(@content).to be_valid
      end
    end

    context '金額が登録できない時' do
      it 'タイトルが空だと登録できない' do
        @content.title = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Titleを入力してください")
      end

      it 'moneyが空だと登録できない' do
        @content.money = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Moneyを入力してください")
      end

      it 'moneyが数値でないと登録できない' do
        @content.money = 'a'
        @content.valid?
        expect(@content.errors.full_messages).to include("Moneyは数値で入力してください")
      end

      it '使用日がないと登録できない' do
        @content.start_time = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Start timeを入力してください")
      end
    end
  end
end