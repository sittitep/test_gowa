class Category < ApplicationRecord
	has_many :shops, dependent: :destroy

	WHITELISTED = [
		{name: "Spa and Massage", marker_url: "https://img.icons8.com/color/48/000000/spa.png"},
		{name: "Nails", marker_url: "https://img.icons8.com/color/48/000000/nail-polish.png"},
		{name: "Hair Removal", marker_url: "https://img.icons8.com/color/48/000000/full-moon.png"},
		{name: "Barbershop", marker_url: "https://img.icons8.com/color/48/000000/ramos.png"}
	].freeze
end
