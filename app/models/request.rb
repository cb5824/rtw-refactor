class Request < ApplicationRecord
  belongs_to :user
  has_many :days
  belongs_to :week

  def mon
    self.days.find {|d| d.num_in_week == 0}
  end

  def tue
    self.days.find {|d| d.num_in_week == 1}
  end

  def wed
    self.days.find {|d| d.num_in_week == 2}
  end

  def thu
    self.days.find {|d| d.num_in_week == 3}
  end

  def fri
    self.days.find {|d| d.num_in_week == 4}
  end

  def sat
    self.days.find {|d| d.num_in_week == 5}
  end

  def sun
    self.days.find {|d| d.num_in_week == 6}
  end

  def status?
    status = "approved"
    cancelled = true
    self.days.each do |day|
      if day.status? == "pending" && status == "approved" && day.cancelled == false && day.populated == true
        status = "pending"
      elsif day.status? == "rejected" && day.cancelled == false && day.populated == true
        status = "rejected"
      end
      if day.populated == true && day.cancelled == false
        cancelled = false
      end
    end
    if cancelled == true
      return "cancelled"
    else
      return status
    end
  end

  def weekly_mp
    all_mps = []
    self.days.each do |day|
      if day.cancelled == false && day.populated == true
        all_mps << day.mp1
        all_mps << day.mp2
      end
    end
    return "#{all_mps.min} -\n #{all_mps.max}"
  end

  def weekly_cp
    all_cps = []
    self.days.each do |day|
      if day.cancelled == false && day.populated == true
        all_cps << day.cp1
        all_cps << day.cp2
      end
    end
    return "#{(CP_ARRAY.rassoc(all_cps.min))[0]} -\n #{(CP_ARRAY.rassoc(all_cps.max))[0]}"
  end

  def weekly_mt1
    value = false
    self.days.each do |day|
      if day.mt1 == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_mt2
    value = false
    self.days.each do |day|
      if day.mt2 == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_mt3
    value = false
    self.days.each do |day|
      if day.mt3 == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_mt4
    value = false
    self.days.each do |day|
      if day.mt4 == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_other
    value = false
    self.days.each do |day|
      if day.other == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def workers_day(daynum)
    day = self.days.find {|d| d.num_in_week == daynum}
    if day.populated == false
      value = "-"
    else
      value = day.worker_primary
      [day.worker_secondary1, day.worker_secondary2, day.worker_secondary3, day.worker_secondary4, day.worker_secondary5, day.worker_secondary6, day.worker_secondary7, day.worker_secondary8, day.worker_secondary9,].each do |worker|
        if worker != "-"
          value += ", #{worker}"
        end
      end
    end
    return value
  end

  def weekly_shift
    all_times = []
    self.days.each do |day|
      if day.cancelled == false && day.populated == true
        all_times << (day.start_time.delete ":").to_i
        all_times << (day.end_time.delete ":").to_i
      end
    end
    earliest = all_times.min.to_s
    latest = all_times.max.to_s
    while earliest.length < 4
      earliest = "0" + earliest
    end
    while latest.length < 4
      latest = "0" + latest
    end
    return "#{earliest} -\n#{latest}"
  end

  def weekly_single_track
    value = false
    self.days.each do |day|
      if day.single_track == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_taw
    value = false
    self.days.each do |day|
      if day.taw == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_form_b
    value = false
    self.days.each do |day|
      if day.form_b == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_form_c
    value = false
    self.days.each do |day|
      if day.form_c == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_track_and_time
    value = false
    self.days.each do |day|
      if day.track_and_time == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def weekly_inacc_track
    value = false
    self.days.each do |day|
      if day.inacc_track == true && day.cancelled == false && day.populated == true
        value = true
      end
    end
    return value
  end

  def approval_status_group(groupnum)
    status = "approved"
    self.days.each do |day|
      if day.cancelled == false && day.populated == true
        case groupnum
        when 1
            if day.approval_group_1 == "pending" && status == "approved"
              status = "pending"
            elsif day.approval_group_1 == "rejected"
              status = "rejected"
            end
        when 2
          if day.approval_group_2 == "pending" && status == "approved"
            status = "pending"
          elsif day.approval_group_2 == "rejected"
            status = "rejected"
          end
        when 3
          if day.approval_group_3 == "pending" && status == "approved"
            status = "pending"
          elsif day.approval_group_3 == "rejected"
            status = "rejected"
          end
        when 4
          if day.approval_group_4 == "pending" && status == "approved"
            status = "pending"
          elsif day.approval_group_4 == "rejected"
            status = "rejected"
          end
        end
      end
    end
    return status
  end

end
