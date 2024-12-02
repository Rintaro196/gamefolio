FactoryBot.define do
  factory :user do
    name { "らんてくん" }
    sequence(:email) { |n| "runteq_#{n}@rspec.com" }
    user_code { "rantekun" }
    password { "rantekun" }
    age { 50 }
  end
end
