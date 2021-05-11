FactoryBot.define do
  factory :item do
    association :user
    item_name            {Faker::Name.initials(number: 6)}
    description          {Faker::Lorem.characters(number: 50)}
    category_id          {Faker::Number.between(from: 2, to: 11)}
    condition_id         {Faker::Number.between(from: 2, to: 7)}
    charges_id           {Faker::Number.between(from: 2, to: 3)}
    prefecture_id        {Faker::Number.between(from: 2, to: 48)}
    delivery_date_id     {Faker::Number.between(from: 2, to: 4)}
    price                {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
