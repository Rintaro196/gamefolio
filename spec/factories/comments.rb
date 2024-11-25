FactoryBot.define do
  factory :comment do
    body { "MyString" }
    user { nil }
    game_log { nil }
  end
end
