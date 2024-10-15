class Game < ApplicationRecord
    validates :game_title, presence: true
end
