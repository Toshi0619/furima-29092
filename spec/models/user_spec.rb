require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_name、lastname、firstname_kana、lastname_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'osjsojo55js'
        @user.password_confirmation = 'osjsojo55js'
        expect(@user).to be_valid
      end
      it 'passwordは半角英数字混合であれば登録できる' do
        @user.password = '18jshda'
        @user.password_confirmation = '18jshda'
        expect(@user).to be_valid
      end
      it 'firstnameが全角であれば登録できる' do
        @user.firstname = '大内'
        expect(@user).to be_valid
      end
      it 'lastnameが全角であれば登録できる' do
        @user.lastname = '康介'
        expect(@user).to be_valid
      end
      it 'firstname_kanaが全角（カタカナ）であれば登録できる' do
        @user.firstname_kana = 'オオウチ'
        expect(@user).to be_valid
      end
      it 'lastname_kanaが全角（カタカナ）であれば登録できる' do
        @user.lastname_kana = 'コウスケ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'ogatagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save # 最初のユーザーを保存
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = 'hjjshda'
        @user.password_confirmation = 'hjjshda'
        @user.valid?
        expect('Password include both letters and numbers')
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '8938393'
        @user.password_confirmation = '8938393'
        @user.valid?
        expect('Password include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'firstnameが全角でなければ登録できない' do
        @user.firstname = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid.Input full-width characters.')
      end
      it 'lastnameが全角でなければ登録できない' do
        @user.lastname = 'takashi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid.Input full-width characters.')
      end
      it 'firstname_kanaが全角（カタカナ）でなければ登録できない' do
        @user.firstname_kana = '阿部'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid. Input full-width katakana characters.')
      end
      it 'lastname_kanaが全角（カタカナ）でなければ登録できない' do
        @user.lastname_kana = '隆'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana is invalid. Input full-width katakana characters.')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
