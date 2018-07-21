class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile
  # requires presence of the user, a first name and last name fields
  validates :user, :first_name, :last_name, :phone, presence: true
  validates :occupation, length: { maximum: 25, too_long: "Please provide a brief answer" }
  validates :description, length: { maximum: 180, too_long: "Maximum %{count} characters allowed" }
  validates :gender, inclusion: { in: %w(Male Female Other), message: "%{value} is not a valid gender" }
end
