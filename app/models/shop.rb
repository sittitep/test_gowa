class Shop < ApplicationRecord
	belongs_to :category
	
	reverse_geocoded_by :latitude, :longitude

	def serialize
		{
			name: name,
			latitude: latitude,
			longitude: longitude,
			icon: category.marker_url
		}
	end
end
