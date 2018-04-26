class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :desc
      t.string :amenities
      t.string :house_rules
      t.string :reviews
      t.string :host
      t.string :location
      t.string :similar_listings
      t.integer :price

      t.timestamps
    end
  end
end
