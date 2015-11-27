require 'csv'


20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

bools = [true, false]

100.times do
  Toilet.create(latitude: rand(37.6959017..37.8047118), longitude: rand(-122.5126904..-122.4169511), num_stalls: rand(1..6), has_hooks: bools.sample, has_mirrors: bools.sample, has_change_tables: bools.sample, toilet_paper: rand(1..5), door_gap: rand(1..5))
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

# csv = CSV.new(body, :headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])
# csv.to_a.map {|row| row.to_hash }