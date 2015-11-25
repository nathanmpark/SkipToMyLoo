
20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

100.times do
  Toilet.create(lat: Faker::address.)
end

1000.times do
  Rating.create(stars: rand(1..5), review: Faker::Lorem.paragraph, user_id: rand(1..20), toilet_id: rand(1..100))
end

