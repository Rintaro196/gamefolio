class Genre < ApplicationRecord
    has_many :game_genres, dependent: :destroy
    has_many :games, through: :game_genres

    validates :name, presence: true

    def localed_ja
        I18n.t("genres.#{name}", default: name)
    end
end
