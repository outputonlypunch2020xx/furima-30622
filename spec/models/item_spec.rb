require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '全ての項目が満たされている' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品画像がない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報がない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報がない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank", 'Item status is not a number')
      end
      it '配送料の負担についての情報がない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it '発送元の地域についての情報がない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数についての情報がない' do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank", 'Shipping days is not a number')
      end
      it '価格についての情報がない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300以上でない' do
        item = build(:item, price: '299')
        item.valid?
        expect(item.errors[:item]).to include
      end
      it '価格の範囲が、¥9,999,999以下でない' do
        item = build(:item, price: '10000000')
        item.valid?
        expect(item.errors[:item]).to include
      end
      it '価格は半角数字のみ保存可能であること' do
        item = build(:item, price: '/\A[0-9]+\z/')
        item.valid?
        expect(item.errors[:item]).to include
      end
   end
  end
end
