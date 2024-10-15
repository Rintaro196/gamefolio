class GameGenre < ApplicationRecord
  belongs_to :game
  belongs_to :genre
end
