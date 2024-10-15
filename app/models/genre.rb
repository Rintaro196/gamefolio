class Genre < ApplicationRecord
    has_many :games_genrus, dependent: :destroy
    has_many :games, thought: :games_genres
    
    validates :name, presence: true
end
