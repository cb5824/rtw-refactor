class Request < ApplicationRecord
  belongs_to :user
  has_many :days
  belongs_to :week

  def status?
    status = "approved"
    self.days.each do |day|
      if day.status? == "pending" && status == "approved"
        status = "pending"
      elsif day.status? == "rejected"
        status = "rejected"
      end
    end
    return status
  end

  def weekly_mp
    all_mps = []
    self.days.each do |day|
      if day.cancelled == false
        all_mps << day.mp1
        all_mps << day.mp2
      end
    end
    return "#{all_mps.min} -\n #{all_mps.max}"
  end

  def weekly_cp
    all_cps = []
    self.days.each do |day|
      if day.cancelled == false
        all_cps << day.cp1
        all_cps << day.cp2
      end
    end
    return "#{(CP_ARRAY.rassoc(all_cps.min))[0]} -\n #{(CP_ARRAY.rassoc(all_cps.max))[0]}"
  end

end
