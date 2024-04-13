(1..10).each do |i|
    user = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email,
        password: 'password',
        password_confirmation: 'password'
    )

    rand(1..10).times do
        user.posts.create(
            photo: Faker::Placeholdit.image(size: '50x50'), 
            description: Faker::Lorem.sentence,
            location: Faker::Address.city,
            status: Faker::Boolean,
        )
    end
    
    rand(1..10).times do
        user.comments.create(body: Faker::Lorem.paragraph)
     end
end