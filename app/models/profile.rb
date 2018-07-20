class Profile < ApplicationRecord
  belongs_to :user
  # add profile fields' valdations
  validates :first_name, :last_name, presence: true
end
