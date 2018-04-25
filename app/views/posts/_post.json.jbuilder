json.extract! post, :id, :name, :desc, :amenities, :house_rules, :reviews, :price, :host, :location, :similar_listings, :created_at, :updated_at
json.url post_url(post, format: :json)
