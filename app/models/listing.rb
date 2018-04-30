class Listing < ApplicationRecord
  	belongs_to :user
  	mount_uploader :image, ImageUploader

  	def self.search(search)
		where("name ILIKE ? OR country ILIKE ?", "%#{search}%", "%#{search}%", ) 
	end

end