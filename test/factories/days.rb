FactoryBot.define do
  factory :day do
    num_in_week {[0..6].sample}
    request
  end
end
