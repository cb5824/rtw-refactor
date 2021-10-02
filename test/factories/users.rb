FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password {'password'}
    password_confirmation {'password'}
    sequence(:name) {|n| "Test User #{n}"}
    phone {'5552220213'}
    sequence(:company) {"TASI: Track"}
    role {"user"}
    approval_group {0}
    active {true}
  end
end
