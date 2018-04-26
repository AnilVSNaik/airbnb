class ChangeVerificationInListing < ActiveRecord::Migration[5.2]
  def change
  	  	remove_column :listings, :verification
  		add_column :listings, :verified, :boolean, default: false
  end
end
