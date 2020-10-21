class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  # before_action :move_to_root_path, only: [:index]
  before_action :item_find, only: [:index, :create]
  before_action :sell_user, only: [:index]
  def index
    @object = ObjectItem.new
  end

  def create
    # binding.pry
    @object = ObjectItem.new(object_params)
    if @object.valid?
      pay_item
      @object.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def object_params
    # binding.pry
    params.require(:object_item).permit(:postal_code, :state_id, :city, :house_number, :bldg, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    # binding.pry
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: object_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    redirect_to root_path unless user_signed_in?
  end

  def sell_user
    redirect_to root_path if current_user.id == @item.user_id
  end
end
