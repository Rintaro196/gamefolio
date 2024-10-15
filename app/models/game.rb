class Game < ApplicationRecord
    has_many :games_genres, dependent: :destroy
    has_many :genres, thought: :games_genres
    has_many :games_platforms, dependent: :destroy
    has_many :platforms, thought: :games_platforms
    
    validates :game_title, presence: true
end
