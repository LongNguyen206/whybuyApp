class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.decimal :rate, :precision => 8, :scale => 2
      t.decimal :deposit, :precision => 8, :scale => 2
      t.string :photo 
      t.text :description

      t.timestamps
    end
  end
end
