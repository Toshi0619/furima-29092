require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name、lastname、firstname_kana、lastname_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "osjsojofjs"
        @user.password_confirmation = "osjsojofjs"
        expect(@user).to be_valid
      end
      it "passwordは半角英数字混合であれば登録できる" do
        @user.password = "18jshda"
        @user.password_confirmation = "18jshda"
        expect(@user).to be_valid
      end
      it "firstnameが全角であれば登録できる" do
        @user.firstname = "大内"
        expect(@user).to be_valid
      end
      it "lastnameが全角であれば登録できる" do
        @user.lastname = "康介"
        expect(@user).to be_valid
      end
      it "firstname_kanaが全角（カタカナ）であれば登録できる" do
        @user.firstname_kana = "オオウチ"
        expect(@user).to be_valid
      end
      it "lastname_kanaが全角（カタカナ）であれば登録できる" do
        @user.lastname_kana = "コウスケ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        
      end
      it "emailが空では登録できない" do
      end
      it "emailに@がないと登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "firstnameが全角でなければ登録できない" do  
      end
      it "lastnameが全角でなければ登録できない" do
      end
      it "firstname_kanaが全角（カタカナ）でなければ登録できない" do
      end
      it "lastname_kanaが全角（カタカナ）でなければ登録できない" do
      end
      it "birthdayが空では登録できない" do
      end
    end
  end
end
