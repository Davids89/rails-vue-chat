3.times do
    user = User.create(name: Faker::HarryPotter.character)
    user.save
end