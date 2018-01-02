class RealEstate < ApplicationRecord

enum category: [:Residential, :Condo, :Multi_Family, :Unknown]

self.per_page = 20


scope :street, -> (street) { where("street like ?", "%#{street}%")}
scope :category, -> (category) { where(:category => category)}
scope :price_max, -> (price_max) { where ("price <= #{price_max}") }
scope :price_min, -> (price_min) { where ("price >= #{price_min}") }
end
