class BuyerManagement
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :address1, :address2, :building_name, :phone_num, :user_id, :item_id  

  with_options presence: true do
    validates :user_id, :item_id, :address1, :address2, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_num, format: {with: /\A\d{10}$|^\d{11}\z/, message: "is invalid"}
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    management = Management.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, address1: address1, address2: address2, building_name: building_name, phone_num: phone_num, management_id: management.id)
  end

end