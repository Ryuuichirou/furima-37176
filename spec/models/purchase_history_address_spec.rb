require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id, item_id: item.id)
      sleep 0.5
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_history_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_history_address.building_name = ''
        expect(@purchase_history_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_cordが空だと保存できないこと' do
        @purchase_history_address.postal_cord = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Postal cord can't be blank")
      end
      it 'postal_cordが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_history_address.postal_cord = '1234567'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Postal cord は半角文字で記述する必要があります')
      end
      it 'prefectures_idが1では保存できないこと' do
        @purchase_history_address.prefectures_id = 1
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_history_address.municipalities = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase_history_address.house_number = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_history_address.telephone_number = ''
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは10桁以上でないと保存できないこと' do
        @purchase_history_address.telephone_number = '090-1234-56789'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Telephone number は半角数値で記述する必要があります')
      end
      it 'telephone_numberは11桁以内でないと保存できないこと' do
        @purchase_history_address.telephone_number = '090-1234-567'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Telephone number は半角数値で記述する必要があります')
      end
      it 'telephone_numberは半角数字以外が含まれている場合保存できないこと' do
        @purchase_history_address.telephone_number = 'あ山y１@'
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include('Telephone number は半角数値で記述する必要があります')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_history_address.user_id = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_history_address.item_id = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_history_address.token = nil
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
