class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @buyer_management = BuyerManagement.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_management = BuyerManagement.new(order_params)
    @item = Item.find(params[:item_id])
    if @buyer_management.valid?
      @buyer_management.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def order_params
      params.require(:buyer_management).permit(:postal_code, :prefecture_id, :address1, :address2, :building_name, :phone_num, :item_name).merge(user_id: current_user.id, item_id: params[:item_id])
    end

end
