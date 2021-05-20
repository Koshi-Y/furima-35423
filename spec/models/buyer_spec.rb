require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @buyer = FactoryBot.build(:buyer)
  end





























# require 'rails_helper'

# RSpec.describe Buyer, type: :model do
#   before do
#     @item = FactoryBot.create(:item)
#     @buyer = FactoryBot.build(:buyer)
#   end
  
#   describe '商品購入機能'
#   context '商品が購入できるとき' do
#     # it 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること' do
#     #   expect(@buyer).to be_valid
#     # end
#   end

#   context '商品が購入できないとき' do
#     it '郵便番号にはハイフンが必要である' do
#       @buyer.postal_code = '1234567'
#       @buyer.valid?
#       expect(@buyer.errors.full_messages).to include("Postal code is invalid")
#     end


    
#   end





# end
