class AddDaysToRentRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :rent_requests, :days, :integer
  end
end
