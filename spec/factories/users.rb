FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { DateTime.now }
    user_name { Faker::Name.name }
    address { Faker::Address.street_address }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { ['male', 'female', 'non-binary', 'other'].sample }
    deactivated { false }

    trait :admin do
      after(:create) do |user|
        user.add_role(:admin)
      end
    end

    trait :user do
      after(:create) do |user|
        user.add_role(:user)
      end
    end
  end
end
