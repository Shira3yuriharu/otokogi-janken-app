require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # 正常系テスト
    it '全ての値が正しいと登録ができる' do
      @user.valid?
      expect(@user).to be_valid
    end

    # 異常系テスト
    it 'ニックネームは空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスに＠が含まれてないと登録できない' do
      @user.email = 'testcom'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it '重複したメールアドレスは登録できない' do
      @user.email = 'test@com'
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = 'test@com'
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include 'Email is invalid'
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが５文字以下だと登録できない' do
      @user.password = 'UUU88'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードとパスワード（確認用）の値が一致しないと登録できない' do
      @user.password = 'UUU888'
      @user.password_confirmation = 'UUU887'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

  end

end
