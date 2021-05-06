FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number:6)}
    email                   {Faker::Internet.free_email}
    password                {'1a' + Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation   {password}
    last_name               {'山下'}
    first_name              {'亨士'}
    last_name_kana          {'ヤマシタ'}
    first_name_kana         {'コウシ'}
    birthday               {'1995-9-10'}
  end
end
