json.extract! listing, :id, :name, :desc, :amenities, :house_rules, :reviews, :price, :host, :location, :similar_listings, :created_at, :updated_at
json.url listing_url(listing, format: :json)
