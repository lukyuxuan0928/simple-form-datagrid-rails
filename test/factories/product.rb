FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { Faker::Hipster.paragraph}
    category { Faker::Hipster.sentence}
    color { Faker::Color.color_name }
    expire_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    price { Faker::Number.decimal(2) }
    stock { Faker::Number.between(1, 20) }
    visible { Faker::Boolean.boolean }
  end
end
