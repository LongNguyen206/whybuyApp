class RentRequest < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  belongs_to :requester, :class_name => 'User'
  belongs_to :listing
  validates :days,
            :presence => true,
            :numericality => { greater_than_or_equal_to: 1, message: "Duration is at least 1 day" }
end
