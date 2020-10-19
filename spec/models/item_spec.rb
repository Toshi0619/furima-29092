require 'rails_helper'

RSpec.describe Item, tupe: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品出品がうまくいくとき' do
      it 'imageとname、descriptionとcategory_id、status_id、beard_id、area_id、days_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionに@がないと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1(「--」)だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category status Select')
      end
      it 'status_idが1(「--」)だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status status Select')
      end
      it 'beard_idが1(「--」)だと登録できない' do
        @item.beard_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Beard status Select')
      end
      it 'area_idが0(「--」)だと登録できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area status Select')
      end
      it 'days_idが1(「--」)だと登録できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days status Select')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でなければ登録できない（全角文字で登録）' do
        @item.price = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number.', 'Price Out of setting range')
      end
      it 'priceが半角数字でなければ登録できない（全角数字で登録）' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number.', 'Price Out of setting range')
      end
      it 'priceが半角数字でなければ登録できない（半角英字で登録）' do
        @item.price = 'rud'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number.', 'Price Out of setting range')
      end
      it 'priceが300円未満ではが空では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが10000000円より大きい金額ではが空では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
