class Category < ApplicationRecord
	has_many :shops, dependent: :destroy

	WHITELISTED = ["Spa and Massage", "Nails", "Hair Removal", "Barbershop"].freeze
end
