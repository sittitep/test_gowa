require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def random_point_in_disk(max_radius)
  r = max_radius * rand**0.5
  theta = rand * 2 * Math::PI
  [r * Math.cos(theta), r * Math.sin(theta)]
end

EarthRadius = 6371 # km
OneDegree = EarthRadius * 2 * Math::PI / 360 * 1000 # 1° latitude in meters

def random_location(lat, lon, max_radius)
  dx, dy = random_point_in_disk(max_radius)
  random_lat = lat + dy / OneDegree
  random_lon = lon + dx / ( OneDegree * Math::cos(lat * Math::PI / 180) )
  [random_lat, random_lon]
end

Category::WHITELISTED.each do |name|
	Category.create(name: name, marker_url: nil)
end
	
category_ids = Category.ids
1000.times do
	#13.736717, 100.523186 Bangkok location, 15 is radius
	location = random_location(13.736717, 100.523186, 15)
	Shop.create(
		name: Faker::Company.name,
		category_id: category_ids.sample,
		latitude: location[0], longitude: location[1]
	)
end
