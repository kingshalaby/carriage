require 'faker'

FactoryBot.define do
  factory :real_estate do |f|
    f.street { Faker::Address.street_address }
    f.city { Faker::Address.city }
    f.zip { Faker::Number.number(5) }
    f.state "CA"
    f.beds  {Faker::Number.between(1, 9)}
    f.baths  {Faker::Number.between(1, 9)}
    f.sq_ft  {Faker::Number.between(400, 2000)}
    f.category   {Faker::Number.between(0, 3)}
    f.sale_date  {Faker::Date.between(10.days.ago, Date.today)}
    f.price      {Faker::Number.between(500, 50000)}
    f.lat  { Faker::Address.latitude }
    f.lng  { Faker::Address.longitude }
  end
end
