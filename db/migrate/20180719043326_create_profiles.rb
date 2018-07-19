class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :dob
      t.string :occupation
      t.text :description

      t.timestamps
    end
  end
end
