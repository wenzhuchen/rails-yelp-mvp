# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Review.destroy_all
Restaurant.destroy_all
puts 'Creating restaurants...'
10.times do |x|
  resto = Restaurant.create(
    { name: Faker::Food.dish,
      address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      phone_number: Faker::PhoneNumber.phone_number,
      category:['chinese', 'italian', 'japanese', 'french', 'belgian'].sample(1).join('')
  })
  rand(4..10).times do |y|
    review = Review.new ({
      content: Faker::LeagueOfLegends.quote,
      rating: rand(0..5)
      })
    review.restaurant = resto
    review.save!
  end
  puts 'Finished!'
end
