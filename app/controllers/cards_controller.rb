class CardsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(card_params)
    if @order.valid?
      @order.save
      redirect_to :index
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
