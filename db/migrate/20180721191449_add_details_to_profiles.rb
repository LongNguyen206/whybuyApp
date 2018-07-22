class AddDetailsToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :iscompany, :boolean, :default => false
    add_column :profiles, :company_name, :string
    add_column :profiles, :photo, :string
    add_column :profiles, :isowner, :boolean, :default => false
  end
end
