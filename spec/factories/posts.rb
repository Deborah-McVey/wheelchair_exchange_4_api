FactoryBot.define do
  factory :post do
    user
    photo { Faker::Placeholdit.image(size: '50x50') }
    description { Faker::Lorem.sentence }
    location { Faker::Lorem.sentence }
    status { Faker:Boolean }
  end
end
