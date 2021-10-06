require 'rails_helper'

feature 'requests' do
  let!(:request1) do
   FactoryBot.create(:request)
  end

  scenario "Is in pending status after being created" do
    expect(request1.status?).to eq('pending')
  end

  scenario "If any day is rejected then the request status is rejected" do
    request1.days[0].approval_group_1 = "rejected"
    expect(request1.status?).to eq('rejected')
  end

  scenario "If alls days are approved then the request status is approved" do
    for i in 0..6 do
      request1.days[i].approval_group_1 = "approved"
      request1.days[i].approval_group_2 = "approved"
      request1.days[i].approval_group_3 = "approved"
      request1.days[i].approval_group_4 = "approved"
    end
    expect(request1.status?).to eq('approved')
  end


end
