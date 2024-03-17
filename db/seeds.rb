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
            photo: Faker::Lorem.word, 
            description: Faker::Lorem.sentence,
            location: Faker::America.word,
            status: Faker::Boolean.word,
        )
    end
    
    rand(1..10).times do
        user.comments.create(body: Faker::Lorem.paragraph)
    end
end