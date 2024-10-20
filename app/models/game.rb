class Game < ApplicationRecord
    has_many :game_genres, dependent: :destroy
    has_many :genres, through: :game_genres
    has_many :game_platforms, dependent: :destroy
    has_many :platforms, through: :game_platforms
    has_many :user_games, dependent: :destroy
    has_many :users, through: :user_games

    validates :game_title, presence: true
end
