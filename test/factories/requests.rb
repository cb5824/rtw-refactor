FactoryBot.define do
  factory :request do
    user
    week
    year {Time.now.year}
  end
end
