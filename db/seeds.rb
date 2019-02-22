require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all

Category::WHITELISTED.each do |name|
	Category.create(name: name, marker_url: nil)
end
	
category_ids = Category.ids
1000.times do |index|
	location = Geocoder::Calculations.random_point_near([13.736717, 100.523186], 30)
	Shop.create(
		name: Faker::Company.name,
		category_id: category_ids.sample,
		latitude: location[0], longitude: location[1]
	)
end
