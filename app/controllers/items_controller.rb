class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update]
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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to acction: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :price, :charges_id,
                                 :prefecture_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    if @item.management.present?
      redirect_to root_path
    end
  end


end
