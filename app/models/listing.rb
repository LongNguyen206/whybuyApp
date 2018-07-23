class Listing < ApplicationRecord
  belongs_to :user
  has_many :rent_requests, dependent: :destroy
end
