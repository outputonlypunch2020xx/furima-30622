class ObjectItem
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :city, :house_number, :bldg, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めてください' }
    validates :state_id, numericality: { other_than: 0, message: 'が入力されていません' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Buyer.create(postal_code: postal_code, state_id: state_id, city: city, house_number: house_number, phone_number: phone_number, order_id: order.id, bldg: bldg)
  end
end
