class Listing < ApplicationRecord
  belongs_to :user
  has_many :rent_requests, dependent: :destroy
  validates :title, 
            :length => { maximum: 25, too_long: "Please provide a brief title" }, 
            :presence => true
  validates :rate, :deposit,
            :numericality => { greater_than_or_equal_to: 0 }
  validates :description, :photo, :date_from,
            :presence => true
  validate  :end_date_after_start_date?

  def end_date_after_start_date?
    if date_to < date_from
      errors.add :date_to, "must be after start date"
    end
  end
  mount_uploader :photo, PhotoUploader
end
