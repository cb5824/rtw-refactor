require 'rails_helper'

feature 'requests' do

  let!(:request1) do
   FactoryBot.create(:request)
  end

  let!(:day1) do
   request1.days[0]
  end

  scenario "Is in pending status after being created" do
    expect(day1.status?).to eq('pending')
  end

  scenario "If any approval group is rejected then the day status is rejected" do
    day1.approval_group_1 = "rejected"
    expect(day1.status?).to eq('rejected')
  end

  scenario "If all approval groups are approved then the day status is approved" do
    for i in 0..6 do
      day1.approval_group_1 = "approved"
      day1.approval_group_2 = "approved"
      day1.approval_group_3 = "approved"
      day1.approval_group_4 = "approved"
    end
    expect(day1.status?).to eq('approved')
  end


end
