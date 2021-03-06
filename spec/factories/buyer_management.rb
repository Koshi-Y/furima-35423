FactoryBot.define do
  factory :buyer_management do

    postal_code            {'765-4321'}
    prefecture_id          {Faker::Number.between(from: 2, to: 48) }
    address1               {Faker::Address.city}
    address2               {Faker::Address.street_address}
    building_name          {Faker::Address.building_number}
    phone_num              {Faker::Number.leading_zero_number(digits: 10)}
    token                  {"tok_abcdefghijk00000000000000000"}

  end
end
