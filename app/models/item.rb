class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :itemstatus
  belongs_to_active_hash :shippingday
  belongs_to_active_hash :shippingfee

  with_options presence: true do
    validates :name 
    validates :text 
    validates :image    
    
      with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_status_id
      validates :shipping_days_id 
      validates :shipping_fee_id
      end
      
    validates :area_id, numericality: { other_than: 0 }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :price, numericality: { greater_than: 299 }
    validates :price, numericality: { less_than: 9_999_999 }
  end

  has_one_attached :image
  belongs_to :user
end
