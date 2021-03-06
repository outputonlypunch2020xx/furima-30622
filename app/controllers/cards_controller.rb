class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:card_token]
    )

    @card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      user_id: current_user.id
    )

    if @card.valid?
      @card.save

    else
      render action: :new
    end
  end
end
