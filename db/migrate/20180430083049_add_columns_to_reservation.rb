class AddColumnsToReservation < ActiveRecord::Migration[5.2]
  def change
	remove_reference :reservations, :users
	remove_reference :reservations, :listings
	add_reference :reservations, :user, index: true, foreign_key: true
	add_reference :reservations, :listing, index: true, foreign_key: true
  end
end
