class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    if @item.management == nil
      @buyer_management = BuyerManagement.new
    else
      redirect_to root_path
    end
  end

  def create
    @buyer_management = BuyerManagement.new(order_params)
    if @buyer_management.valid?
      pay_item
      @buyer_management.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def order_params
      params.require(:buyer_management).permit(:postal_code, :prefecture_id, :address1, :address2, :building_name, :phone_num, :item_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],
        currency: 'jpy'      
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def move_to_index
      if (current_user == @item.user) || (@item.management.present? )
        redirect_to root_path
      end
    end


end
