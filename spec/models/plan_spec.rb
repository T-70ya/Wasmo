require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe '#create' do
    before do
      @plan = FactoryBot.create(:plan)
    end

    context '目標金額が登録できる時' do
      it '全てが正しく入力されていたら登録できる' do
        expect(@plan).to be_valid
      end
    end

    context '目標金額が登録できない時' do
      it '目標金額が空だと登録できない' do
        @plan.target = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Targetを入力してください")
      end

      it '目標金額が数値でないと登録できない' do
        @plan.target = 'aaaa' 
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Targetは数値で入力してください")
      end

      it '目標月が空だと登録できない' do
        @plan.target_month = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Target monthを入力してください")
      end

      it '一人のユーザーは同じ月の目標金額は一回しか登録できない' do
        @plan.save
        another_target_month = FactoryBot.build(:plan, user_id: @plan.user_id, target_month: @plan.target_month)
        another_target_month.valid?
        expect(another_target_month.errors.full_messages).to include("Userはすでに存在します")
      end
    end
  end
end