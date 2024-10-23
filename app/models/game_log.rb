class GameLog < ApplicationRecord
  belongs_to :user
  belongs_to :user_game

  validates :title, length: { maximum: 140 }
  validates :body, length: { maximum: 3000 }
  validates :play_time, :spending_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
