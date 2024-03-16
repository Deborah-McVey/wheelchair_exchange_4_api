FactoryBot.define do
  factory :post do
    photo { "MyString" }
    description { "MyString" }
    location { "MyString" }
    status { false }
    user { nil }
  end
end
