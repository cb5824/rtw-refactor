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

  scenario "Can parse a weeks worth of MP into one range" do
    for i in 0..6 do
      request1.days[i].mp1 = 2.0
      request1.days[i].mp2 = 2.0
    end
    request1.days[4].mp1 = 3.0
    expect(request1.weekly_mp).to eq('2.0 -\n 3.0')

    for i in 0..6 do
      request1.days[i].mp1 = 6.0
      request1.days[i].mp2 = 6.0
    end
    request1.days[3].mp1 = 3.0
    request1.days[1].mp2 = 11.0
    expect(request1.weekly_mp).to eq('3.0 -\n 11.0')

    request1.days[3].mp2 = 3.0
    request1.days[1].mp1 = 11.0
    expect(request1.weekly_mp).to eq('3.0 -\n 11.0')

  end

  scenario "Can parse a weeks worth of CP into one range" do
    for i in 0..6 do
      request1.days[i].cp1 = 2
      request1.days[i].cp2 = 6
    end
    request1.days[4].cp1 = 26
    expect(request1.weekly_cp).to eq('S.L. CP 4th -\n S.L. CP Ralston')
    for i in 0..6 do
      request1.days[i].cp1 = 6
      request1.days[i].cp2 = 6
    end
    request1.days[4].cp1 = 3
    request1.days[4].cp2 = 11
    expect(request1.weekly_cp).to eq('N.L. CP Common -\n N.L. CP Brisbane')

    request1.days[4].cp2 = 3
    request1.days[4].cp1 = 11
    expect(request1.weekly_cp).to eq('N.L. CP Common -\n N.L. CP Brisbane')

  end


end
