require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能"
    context "商品登録ができるとき" do
      it "image,item_name,description,category_id,condition_id,charges_id,prefecture_id,delivery_date_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品登録ができないとき" do
      it "imageが空と登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include( "Image can't be blank" )
      end
      it "商品名が空だと登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Item name can't be blank" )
      end
      it "商品の説明が空だと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Description can't be blank" )
      end
      it "カテゴリーの情報がないと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Category can't be blank" )
      end
      it "category_idのid=1は登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Category must be other than 1" )
      end
      it "商品状態についての情報がないと登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Condition can't be blank" )
      end
      it "condition_idのid=1は登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Condition must be other than 1" )
      end
      it "発送元の地域についての情報がないと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Prefecture can't be blank" )
      end
      it "prefecture_idのid=1は登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Prefecture must be other than 1" )
      end
      it "発送までの日数についての情報がないと登録できない" do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Delivery date can't be blank" )
      end
      it "delivary_date_idのid=1は登録できない" do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Delivery date must be other than 1" )
      end
      it "配送料の負担についての情報がないと登録できない" do
        @item.charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charges can't be blank")
      end
      it "charges_idのid=1は登録できない" do
        @item.charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Charges must be other than 1" )
      end
      it "販売価格が空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price can't be blank" )
      end
      it "販売価格は300円未満だと登録できない" do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not included in the list" )
      end
      it "販売価格は9999999円より高いと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not included in the list" )
      end
      it "販売価格は半角数字でないと登録できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is not included in the list" )
      end
      it "値段は半角英数混合では登録できない" do
        @item.price = 'k12345'
        @item.valid
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "値段は半角英語だけでは登録できない" do
        @item.price = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end

end
