class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :area_id, :category_id, :item_status_id, :shipping_days_id, :shipping_fee_id, :image, :price).merge(user_id: current_user.id)
  end
end
