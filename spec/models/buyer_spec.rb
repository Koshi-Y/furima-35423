require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @buyer = FactoryBot.build(:buyer)
  end
