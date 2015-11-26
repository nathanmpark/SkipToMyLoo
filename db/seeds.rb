
20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

bools = [true, false]

100.times do
  Toilet.create(lat: rand(37.6959017..37.8047118), long: rand(-122.5126904..-122.4169511), num_stalls: rand(1..6), has_hooks: bools.sample, has_mirrors: bools.sample, has_change_tables: bools.sample, toilet_paper: rand(1..5), door_gap: rand(1..5))
end

1000.times do
  Rating.create(stars: rand(1..5), review: Faker::Lorem.paragraph, user_id: rand(1..20), toilet_id: rand(1..100))
end

