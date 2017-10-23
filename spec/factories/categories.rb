FactoryBot.define do
  factory :category do
    sequence :title do
      Faker::Name.title
    end
  end
end
