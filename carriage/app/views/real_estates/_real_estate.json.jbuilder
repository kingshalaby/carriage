json.extract! real_estate, :id, :street, :city, :zip, :state, :beds, :baths, :sq_ft, :category, :sale_date, :price, :lat, :lng, :created_at, :updated_at
json.url real_estate_url(real_estate, format: :json)
