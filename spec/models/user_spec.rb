require 'rails_helper'

RSpec.describe User, type: :model do
end

describe 'ユーザー新規登録' do
  context '新規登録できる場合' do
    it "nicknameとemail、passwordとpassword_confirmationとfirst_name、family_name、first_name_kana、family_name_kana、birth_dayが存在すれば登録できる" do
      user = FactoryBot.build(:user)
      expect(@user).to be_valid
    end
  end
  context '新規登録できない場合' do
  end
end