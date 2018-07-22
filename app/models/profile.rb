class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile
  # require presence of the user and phone fields for ALL profiles, phone numbers must be unique
  validates :user, presence: true
  validates :phone, presence: true, uniqueness: true
  # require presence of the company name UNLESS it's an individual user
  validates :company_name, presence: true, uniqueness: true, :unless => :first_name?
  # require presence of first and last names UNLESS it's a company
  validates :first_name, :last_name, presence: true, :unless => :company_name?
  # set max length for 'occupation' and 'description' fields
  validates :occupation, length: { maximum: 25, too_long: "Please provide a brief answer" }
  validates :description, length: { maximum: 180, too_long: "Maximum %{count} characters allowed" }
  # only allow a gender to be of following options (further validated with the radio buttons in form)
  validates :gender, inclusion: { in: %w(Male Female Other), message: "%{value} is not a valid gender" }, allow_nil: true
  
  # validates :terms_of_service, acceptance: true

end
