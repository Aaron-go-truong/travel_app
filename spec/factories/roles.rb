FactoryBot.define do
  factory :role do
    name { Faker::Lorem.word }
    resource_type { Faker::Lorem.word }
    resource_id { Faker::Number.unique.between(from: 1, to: 100) }
  end
end
