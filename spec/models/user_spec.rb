require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザーが登録できる時' do
      it '全て存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが登録できない時' do
      it 'ユーザーが空だと登録できない' do
        @user.username = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Usernameを入力してください")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end

      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
      end

      it 'passwordとpassword_confirmationが一致にしないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation  = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
    end
  end
end