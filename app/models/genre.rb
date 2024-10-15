class Genre < ApplicationRecord
    has_many :game_genrus, dependent: :destroy
    has_many :games, thought: :game_genres
    
    validates :name, presence: true
end
