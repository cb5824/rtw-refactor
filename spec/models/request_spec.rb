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
    expect(request1.weekly_mp).to eq("2.0 -\n 3.0")

    for i in 0..6 do
      request1.days[i].mp1 = 6.0
      request1.days[i].mp2 = 6.0
    end
    request1.days[3].mp1 = 3.0
    request1.days[1].mp2 = 11.0
    expect(request1.weekly_mp).to eq("3.0 -\n 11.0")

    request1.days[3].mp2 = 3.0
    request1.days[1].mp1 = 11.0
    expect(request1.weekly_mp).to eq("3.0 -\n 11.0")

  end

  scenario "Can parse a weeks worth of CP into one range" do
    for i in 0..6 do
      request1.days[i].cp1 = 2
      request1.days[i].cp2 = 6
    end
    request1.days[4].cp1 = 26
    expect(request1.weekly_cp).to eq("S.L. CP 4th -\n S.L. CP Ralston")
    for i in 0..6 do
      request1.days[i].cp1 = 6
      request1.days[i].cp2 = 6
    end
    request1.days[4].cp1 = 3
    request1.days[4].cp2 = 11
    expect(request1.weekly_cp).to eq("N.L. CP Common -\n N.L. CP Brisbane")

    request1.days[4].cp2 = 3
    request1.days[4].cp1 = 11
    expect(request1.weekly_cp).to eq("N.L. CP Common -\n N.L. CP Brisbane")

  end

  scenario "Can accurately parse a weeks worth of MT1 to a true/false value" do
    expect(request1.weekly_mt1).to eq(false)
    request1.days[3].mt1 = true
    expect(request1.weekly_mt1).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of MT2 to a true/false value" do
    expect(request1.weekly_mt2).to eq(false)
    request1.days[3].mt2 = true
    expect(request1.weekly_mt2).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of MT3 to a true/false value" do
    expect(request1.weekly_mt3).to eq(false)
    request1.days[3].mt3 = true
    expect(request1.weekly_mt3).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of MT4 to a true/false value" do
    expect(request1.weekly_mr4).to eq(false)
    request1.days[3].mr4 = true
    expect(request1.weekly_mr4).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of the Other field to a true/false value" do
    expect(request1.weekly_other).to eq(false)
    request1.days[3].other = true
    expect(request1.weekly_other).to eq(true)
  end

  scenario "Can accurately parse each day's worker allocation into a string" do
    expect(request1.workers_day(0)).to eq("-")
    expect(request1.workers_day(1)).to eq("-")
    expect(request1.workers_day(2)).to eq("-")
    expect(request1.workers_day(3)).to eq("-")
    expect(request1.workers_day(4)).to eq("-")
    expect(request1.workers_day(5)).to eq("-")
    expect(request1.workers_day(6)).to eq("-")
    request1.days[0].worker_primary = "A"
    request1.days[0].worker_primary = "sW"
    request1.days[4].worker_primary = "R"
    expect(request1.workers_day(0)).to eq("A, sW")
    expect(request1.workers_day(4)).to eq("R")

  end

  scenario "Can accurately parse a weeks worth of shift data into a string" do
    expect(request1.weekly_shift).to eq("0100 -\n0200")
    request1.days[4].end_time = "1100"
    expect(request1.weekly_shift).to eq("0100 -\n1100")
    request1.days[6].start_time = "0030"
    expect(request1.weekly_shift).to eq("0030 -\n1100")
  end

  scenario "Can accurately parse a weeks worth of single tracking data to a true/false value" do
    expect(request1.weekly_single_track).to eq(false)
    request1.days[3].single_track = true
    expect(request1.weekly_single_track).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of TAW data to a true/false value" do
    expect(request1.weekly_taw).to eq(false)
    request1.days[3].taw = true
    expect(request1.weekly_taw).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of Form B data to a true/false value" do
    expect(request1.weekly_form_b).to eq(false)
    request1.days[3].form_b = true
    expect(request1.weekly_form_b).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of Form C to a true/false value" do
    expect(request1.weekly_form_c).to eq(false)
    request1.days[3].form_c = true
    expect(request1.weekly_form_c).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of T&T data to a true/false value" do
    expect(request1.weekly_track_and_time).to eq(false)
    request1.days[3].track_and_time = true
    expect(request1.weekly_track_and_time).to eq(true)
  end

  scenario "Can accurately parse a weeks worth of Inacc Track data to a true/false value" do
    expect(request1.weekly_inacc_track).to eq(false)
    request1.days[3].inacc_track = true
    expect(request1.weekly_inacc_track).to eq(true)
  end


end
