class AddColumnToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :place_type, :string
    add_column :listings, :property_type, :string
    add_column :listings, :room_number, :integer
    add_column :listings, :bed_number, :integer
    add_column :listings, :guest_number, :integer
    add_column :listings, :country, :string
    add_column :listings, :state, :string
    add_column :listings, :city, :string
    add_column :listings, :zipcode, :string
    add_column :listings, :street_address, :string
    remove_column :listings, :amenities
    remove_column :listings, :house_rules
    remove_column :listings, :reviews
    remove_column :listings, :location
    remove_column :listings, :similar_listings
    remove_column :listings, :host	
    remove_column :users, :phone
    add_column :users, :phone, :string
  end
end
