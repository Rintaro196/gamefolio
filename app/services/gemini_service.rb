require "httparty"

class GeminiService
    def initialize
        @user_games = current_user.user_game.game_titles

        genres = games.joins(:genres)
                      .group("genres.name")
                      .order("count(genres.name) DESC")
                      .limit(5)

        @user_top_5_genres = current_user.genres
        @user_game_counts = current_user.games.count("games.game_title")
    end

    def get_user_title(user)
    end
end