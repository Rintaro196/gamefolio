class SearchGameForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :game_title, :string

    validates :game_title, presence: true, length: { maximum: 255 }

    def search_game(game_title)
    end
end