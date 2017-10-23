FactoryBot.define do
  factory :category do
    sequence :title do
      Faker::Name.title
    end

    factory :category_with_ideas do
      after(:create) do |category|
        ideas = create_list(:idea_with_category, 10)
        category.ideas = ideas
      end
    end
  end

  factory :idea do
    sequence :title do
      Faker::Name.title
    end

    sequence :body do
      Faker::Lorem.sentence
    end

    factory :idea_with_category do
      after(:create) do |idea|
        idea.category = create(:category)
      end
    end
  end
end