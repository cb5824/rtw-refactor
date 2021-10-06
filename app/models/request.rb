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

end
