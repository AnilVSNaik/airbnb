class RemoveReference < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :listings, :users, index: true, foreign_key: true
  end
end
