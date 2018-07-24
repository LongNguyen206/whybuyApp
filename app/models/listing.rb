class Listing < ApplicationRecord
  belongs_to :user
  has_many :rent_requests, dependent: :destroy
  validates :title, 
            :length => { maximum: 25, too_long: "Please provide a brief title" }, 
            :presence => true
  validates :rate, :deposit,
            :numericality => { greater_than_or_equal_to: 0 }
  validates :description, :photo, :date_from, :date_to,
            :presence => true
  validate  :end_date_after_start_date?
  validate  :minimum_duration?

  def end_date_after_start_date?
    if date_to < date_from
      errors.add(:date_to, "End date must be after the start date")
    end
  end
  def minimum_duration?
    if date_to == date_from
      errors.add(:date_to, "The minimum duration is 1 day")
    end
  end
  mount_uploader :photo, PhotoUploader    
end
