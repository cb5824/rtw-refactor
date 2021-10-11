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
      request.days.each_with_index do |day, i|
        day.num_in_week = i
        day.save
      end
      [0,2,4].each do |i|
        request.days[i].populated = true
        request.days[i].start_time = "01:00"
        request.days[i].end_time = "03:00"
        request.days[i].cp2 = 4
        request.days[i].mt1 = "1.0"
        request.days[i].mt2 = "2.0"
        request.days[i].worker_primary = "A"
        request.days[i].worker_secondary1 = "sW"
        request.days[i].worker_secondary2 = "T"
        request.days[i].save
      end

    end
  end
end
