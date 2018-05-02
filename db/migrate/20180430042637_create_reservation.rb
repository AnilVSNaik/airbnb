class CreateReservation < ActiveRecord::Migration[5.2]
  def change
  	create_table :reservations do |t|
      t.references :users, index: true, foreign_key: true
      t.references :listings, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end