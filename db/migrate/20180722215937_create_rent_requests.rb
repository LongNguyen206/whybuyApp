class CreateRentRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :rent_requests do |t|
      t.references :owner
      t.references :requester
      t.decimal :total_price, :precision => 8, :scale => 2
      t.boolean :accepted, :default => false

      t.timestamps
    end
    add_foreign_key :rent_requests, :users, column: :owner_id, primary_key: :id
    add_foreign_key :rent_requests, :users, column: :requester_id, primary_key: :id
  end
end
