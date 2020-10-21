require 'rails_helper'

RSpec.describe ObjectItem, type: :model do
  describe '商品購入者情報' do
    before do
      @object_item = FactoryBot.build(:object_item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@object_item).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @object_item.postal_code = nil
      @object_item.valid?
      expect(@object_item.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @object_item.postal_code = '1234567'
      @object_item.valid?
      expect(@object_item.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県を選択していないと保存できないこと' do
      @object_item.state_id = 0
      @object_item.valid?
      expect(@object_item.errors.full_messages).to include("State can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @object_item.city = nil
      @object_item.valid?
      expect(@object_item.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @object_item.house_number = nil
      @object_item.valid?
      expect(@object_item.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @object_item.phone_number = nil
      @object_item.valid?
      expect(@object_item.errors.full_messages).to include("Phone number can't be blank")
    end
    it '建物名は空でも保存できること' do
      @object_item.bldg = nil
      expect(@object_item).to be_valid
    end
    it 'tokenが空では登録できないこと' do
      @object_item.token = nil
      @object_item.valid?
      expect(@object_item.errors.full_messages).to include("Token can't be blank")
    end
  end
end
