require 'rails_helper'

RSpec.describe BuyerManagement, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item,user_id: @user.id)
    @buyer_management = FactoryBot.build(:buyer_management, user_id: @user.id, item_id: @item.id)
    sleep 1
  end
  
  describe '商品購入機能'
  context '商品が購入できるとき' do
     it '必要な情報を入力すれば登録ができる' do
       expect(@buyer_management).to be_valid
     end
  end

  context '商品が購入できないとき' do
    it '郵便番号にはハイフンが必要である' do
      @buyer_management.postal_code = 1234567
      @buyer_management.valid?
      expect(@buyer_management.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '発送元の地域についての情報がないと登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idのid=1は登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'address1への情報がないと登録できない' do
      @buyer_management.address1 = ''
      @buyer_management.valid?
      expect(@buyer_management.errors.full_messages).to include("Address1 can't be blank")
    end
    it 'address2への情報がないと登録できない' do
      @buyer_management.address2 = ''
      @buyer_management.valid?
      expect(@buyer_management.errors.full_messages).to include("Address2 can't be blank")
    end
    it '電話番号が空だと登録できない' do
      @buyer_management.phone_num = ''
      @buyer_management.valid?
      expect(@buyer_management.errors.full_messages).to include("Phone num can't be blank")
    end
    it '電話番号は全角数字では登録できない' do
      @buyer_management.phone_num = '１２３４５６７８'
      @buyer_management.valid?
      expect(@buyer_management.errors.full_messages).to include("Phone num is invalid")
    end
    it '電話番号は11桁の半角整数でないと登録できない' do
      @buyer_management.phone_num = '090123456789'
      @buyer_management.valid?
      expect(@buyer_management.errors.full_messages).to include("Phone num is invalid")
    end
    it "tokenが空では登録できないこと" do
      @buyer_management.token = nil
      @buyer_management.valid?
      expect(@buyer_management.errors.full_messages).to include("Token can't be blank")
    end



    
  end





end
