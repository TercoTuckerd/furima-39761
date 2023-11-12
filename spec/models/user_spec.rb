require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmationとfirst_name、family_name、first_name_kana、family_name_kana、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英数字混合でない場合登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'first_nameとfamily_nameが空では登録できない' do
        @user.first_name = ''
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "Family name can't be blank")
      end
      it 'first_nameとfamily_nameが全角(漢字・ひらがな・カタカナ)でない場合登録できない' do
          @user.first_name = 'sam'
          @user.family_name = 'ple'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid", "Family name is invalid")  
      end
      it 'first_name_kanaとfamily_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "Family name kana can't be blank")
      end
      it 'first_name_kanaとfamily_name_kanaが全角(カタカナ)でない場合登録できない' do
        @user.first_name_kana = 'sam'
        @user.family_name_kana = 'ple'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid", "Family name kana is invalid")  
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
