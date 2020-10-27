class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_back
    end
  end

  def show
    user = User.find(params[:id])
    @items = user.items
    @user = User.find(params[:id])

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)

    # redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :birthday, :family_name, :first_name, :family_name_kana, :first_name_kana)
  end
end
