FactoryBot.define do
  factory :item do
    name                { Faker::Name.initials(number: 2) }
    text                { Faker::Lorem.sentence }
    category_id         { 2 }
    item_status_id      { 2 }
    area_id             { 1 }
    shipping_days_id    { 2 }
    shipping_fee_id     { 2 }
    price               { 9999 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
