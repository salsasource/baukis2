FactoryBot.define do
  factory :administrator do
    sequence(:email) { |n| "administrator#{n}@example.com" }
    password { "pw" }
    suspended { false }
  end
end
