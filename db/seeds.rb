require 'csv'

20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

bools = [true, false]

# Take out the columns that we don't need
sf_toilets = CSV.read('geocoded_public_restrooms_sf.csv', headers: true)
sf_toilets.delete('supervisory_district')
sf_toilets.delete('zip')
sf_toilets.delete('jurisdiction')
sf_toilets.delete('hours_monday')
sf_toilets.delete('hours_tuesday')
sf_toilets.delete('hours_wednesday')
sf_toilets.delete('hours_thursday')
sf_toilets.delete('hours_friday')
sf_toilets.delete('hours_saturday')
sf_toilets.delete('hours_sunday')
sf_toilets.delete('remarks')

# this has to work. why wouldn't it?

sf_toilets.each do |row|
  p Toilet.create(row.to_hash)
end

1000.times do
  Rating.create(stars: rand(1..5), review: Faker::Lorem.paragraph, user_id: rand(1..20), toilet_id: rand(1..68))
end
