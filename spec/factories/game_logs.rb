FactoryBot.define do
  factory :game_log do
    sequence(:title, "title_1")
    body {"aaa"}
    play_time { 60 }
    spending_amount { 10000 }
    association :user
    association :user_game
  end
end