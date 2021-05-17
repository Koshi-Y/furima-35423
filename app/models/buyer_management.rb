class BuyerManagement
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :address1, :address2, :building_name, :phone_num, :management_id, :user_id, :item_id  

  with_options presence: true do
    validates :management_id, :user_id, :item_id
    validates :
  end

  def save
    management = Management.create(user_id: user_id, item_id: item_id)

    Address.create(:postal_code, :prefecture_id, :address1, :address2, :building_name, :phone_num, :management_id: management.id)
  end

end



