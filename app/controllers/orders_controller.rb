class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_order, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]


  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(card_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.card != nil
      redirect_to root_path
    end
  end

end