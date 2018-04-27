json.extract! listing, :id, :name, :desc, :place_type, :property_type, :room_number, :price, :bed_number, :guest_number, :country, :state, :city, :zipcode, :street_address, :verified, :image, :created_at, :updated_at
json.url listing_url(listing, format: :json)
