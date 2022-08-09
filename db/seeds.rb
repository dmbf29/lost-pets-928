puts 'Cleaing the DB... destroying pets'
Pet.destroy_all

puts 'Creating pets....'
30.times do
  Pet.create!(
    name: Faker::Creature::Cat.unique.name,
    address: Faker::Address.street_address,
    species: Pet::SPECIES.sample,
    found_on: Date.today - rand(1..15)
  )
end
puts "... created #{Pet.count} pets"
