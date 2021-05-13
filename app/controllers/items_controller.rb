class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to acction: :show
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :price, :charges_id,
                                 :prefecture_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless (current_user == item.user) && user_signed_in? 
      redirect_to action: :index
    end
  end
end
