class Day < ApplicationRecord
  belongs_to :request

  def status?
    if self.approval_group_1 == "approved" && self.approval_group_2 == "approved" && self.approval_group_3 == "approved" && self.approval_group_4 == "approved"
      return "approved"
    elsif self.approval_group_1 == "rejected" || self.approval_group_2 == "rejected" || self.approval_group_3 == "rejected" || self.approval_group_4 == "rejected"
      return "rejected"
    else
      return "pending"
    end
  end

end
