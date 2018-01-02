# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Sacramentorealestatetransactions.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = RealEstate.new
  t.street = row['street']
  t.city = row['city']
  t.zip = row['zip']
  t.state = row['state']
  t.beds = row['beds']
  t.baths = row['baths']
  t.sq_ft = row['sq__ft']
  case row['type']
    when "Residential"
      t.category = 0
    when "Condo"
      t.category = 1
    when "Multi-Family"
      t.category = 2
    else
      t.category = 3
   end
  
  t.sale_date = row['sale_date']
  t.price = row['price']
  t.lat = row['latitude']
  t.lng = row['longitude']
  t.save  
end
puts "There are now #{RealEstate.count} rows in the real_estates table"

