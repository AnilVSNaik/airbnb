class ChangeStatusForReservations < ActiveRecord::Migration[5.2]
  def change
  	remove_column :reservations, :status
  	add_column :reservations, :status, :boolean, default: false
  end
end
