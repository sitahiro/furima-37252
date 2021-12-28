class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.all.order(id: "DESC")
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
  end 

  #def edit
  #end

  #def update
    #@item.update(item_params)
  #end

  private

  def item_params
    params.require(:item).permit(:items_name, :explanation, :price, :category_id, :situation_id, :cost_id, :prefecture_id,:days_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
