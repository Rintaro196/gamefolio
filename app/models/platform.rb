class Platform < ApplicationRecord
    has_many :game_platforms, dependent: :destroy
    has_many :games, through: :game_platforms
    
    validates :name, presence: true
end
