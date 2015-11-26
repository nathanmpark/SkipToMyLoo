require 'csv'


20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

100.times do
  Toilet.create(lat: Faker::address.)
end

1000.times do
  Rating.create(stars: rand(1..5), review: Faker::Lorem.paragraph, user_id: rand(1..20), toilet_id: rand(1..100))
end

# csv_text = File.read('...')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   select_data = row.
#   Toilet.new(row.to_hash)
# end

# CSV.foreach(file, headers: true).with_index(1) do |row, index|
#   next if index.between?(2..11)
# end

# csv = CSV.read('public_restroom_sf.csv')
# table = CSV.table('public_restroom_sf.csv')

# Take out the columns that we don't need
sf_toilets = CSV.read('public_restroom_sf.csv', header: true)
sf_toilets.delete('supervisory_district')
sf_toilets.delete('zip')
sf_toilets.delete('jurisdiction')
# this has to work. why wouldn't it?

sf_toilets.each do |row|
  Toilet.create(row.to_hash)
end