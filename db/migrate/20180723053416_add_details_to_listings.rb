class AddDetailsToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :date_from, :date
    add_column :listings, :date_to, :date
  end
end
