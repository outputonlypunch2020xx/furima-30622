FactoryBot.define do
  factory :object_item do
    postal_code { '909-1009' }
    state_id { '1' }
    city { '府中市' }
    house_number { '1-1' }
    phone_number { '09034567890' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
