class Request < ApplicationRecord
  belongs_to :user
  has_many :days
  belongs_to :week
end
