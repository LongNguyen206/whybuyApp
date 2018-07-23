class AddListingToRentRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :rent_requests, :listing, foreign_key: true
  end
end
