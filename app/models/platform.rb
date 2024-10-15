class Platform < ApplicationRecord
　　has_many :games_platforms, dependent: :destroy
    has_many :games, thought: :games_platforms
    
    validates :name, presence: true
end
