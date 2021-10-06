FactoryBot.define do
  factory :request do
    user
    week
    year {Time.now.year}
    after(:create) do |request, evaluator|
      [0, 1, 2, 3, 4, 5, 6].each do |i|
        FactoryBot.create(:day, request: request, num_in_week: i)
      end
    end
  end
end
