# == Schema Information
#
# Table name: real_estates
#
#  id         :integer          not null, primary key
#  street     :string
#  city       :string
#  zip        :integer
#  state      :string
#  beds       :integer
#  baths      :integer
#  sq_ft      :integer
#  category   :integer
#  sale_date  :date
#  price      :integer
#  lat        :float
#  lng        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RealEstate < ApplicationRecord

validates :street, :city, :category, presence: true
validates :zip, :beds, :baths, :sq_ft, :price, :lat, :lng, numericality: true

validates :zip, length: { is: 5 }



enum category: [:Residential, :Condo, :Multi_Family, :Unknown]

self.per_page = 20


scope :street, -> (street) { where("street like ?", "%#{street}%")}
scope :category, -> (category) { where(category: category)}
scope :price_max, -> (price_max) { where ("price <= #{price_max}") }
scope :price_min, -> (price_min) { where ("price >= #{price_min}") }
scope :sq_max, -> (sq_max) { where ("sq_ft <= #{sq_max}") }
scope :sq_min, -> (sq_min) { where ("sq_ft >= #{sq_min}") }
end
