class GameLog < ApplicationRecord
  belongs_to :user
  belongs_to :user_game
end
