FactoryBot.define do
  factory :request do
    sequence(:project) {|n| "Test Project name #{n}" }
    sequence(:work_directive) {|n| "Work directive #{n}" }
    sequence(:contractor) {|n| "Contractor #{n}" }
    sequence(:title) {|n| "Title #{n}" }
    description {"Test description. This is a request."}
    sswps {"Test SSWPs"}
    change_notices {"Test Change Notices"}
    sequence(:requestor_name) {|n| "Contractor #{n}" }
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
