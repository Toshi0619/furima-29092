require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '住所情報・カード情報の保存' do
    before do
      @address_order = FactoryBot.build(:address_order)
    end
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @address_order.building_name = nil
        expect(@address_order).to be_valid
      end
    end
    context '購入がうまくいかない時' do
      it 'tokenが空では登録できないこと' do
        @address_order.token = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postcodeが空だと保存できないこと' do
        @address_order.postcode = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address_order.postcode = '1234567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Postcode Input correctly')
      end
      it 'postcodeが半角のハイフンを含んではいるが、123-3456のような「数字３桁-数字4桁」になっていないこと' do
        @address_order.postcode = '1234-567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Postcode Input correctly')
      end
      it 'postcodeが半角のハイフンを含んではいるが、全角数字が入っている場合' do
        @address_order.postcode = '１２３４-５６７'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Postcode Input correctly')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @address_order.prefecture_id = 0
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Prefecture Select')
      end
      it 'municipalityが空だと保存できないこと' do
        @address_order.municipality = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @address_order.address = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @address_order.phone_number = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフン込みの半角数字だと保存できないこと' do
        @address_order.phone_number = '000-000-000'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Phone number Input only half number')
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @address_order.phone_number = '９０９８９４７２４９４'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Phone number Input only half number')
      end
      it 'phone_numberが12桁以上の数字だと保存できないこと' do
        @address_order.phone_number = 123456789011
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Phone number Input only half number')
      end 
    end
  end
end
