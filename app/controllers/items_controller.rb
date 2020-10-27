class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :item_find, only: [:edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :click_order_item, only: [:order]

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

  def show
    @messages = Message.all
    @message = Message.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def order
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
    )
    ClickOrder.create(item_id: params[:id])
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :area_id, :category_id, :item_status_id, :delivery_time_id, :shipping_fee_id, :image, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
  end

  def click_order_item
    @item = Item.find(params[:id])
  end
end
