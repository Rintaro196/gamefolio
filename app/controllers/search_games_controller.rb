require "httparty"

class SearchGamesController < ApplicationController
    before_action :authenticate_user!

    def search
        @game_title = params[:title]

        if @game_title.present?
          @game_info = search_game(@game_title)
        else
          @game_info = nil
        end
    end

    private

    def search_game(title)
        url = "https://api.igdb.com/v4/games"
        token = Token.find_by(id: 1)
        headers = {
          "Client-ID" => ENV["CLIENT_ID"],
          "Authorization" => "Bearer #{token.access_token}"
        }

        query = "search \"#{title}\"; fields name, genres.name, platforms.name, cover.url, game_localizations.region, game_localizations.cover.image_id, game_localizations.name; where category = (0,2,4,8,9,10,11) & version_parent = null;"

        response = HTTParty.post(url, headers: headers, body: query)

        games = JSON.parse(response.body)

        games.map { |game| choose_japanese_localization(game) }
    end

    def choose_japanese_localization(game_data)
      japanese_localization = game_data["game_localizations"]&.find { |loc| loc["region"] == 3 }

      if japanese_localization
        {
          name: japanese_localization["name"] || game_data["name"],
          cover_url: japanese_localization["cover"] ? cover_image_url(japanese_localization["cover"]["image_id"]) : game_data.dig("cover", "url"),
          genres: game_data["genres"]&.map { |genre| genre["name"] },
          platforms: game_data["platforms"]&.map { |platform| platform["name"] }
        }
      else
        {
          name: game_data["name"],
          cover_url: game_data.dig("cover", "url"),
          genres: game_data["genres"]&.map { |genre| genre["name"] },
          platforms: game_data["platforms"]&.map { |platform| platform["name"] }
        }
      end
    end

    def cover_image_url(image_id)
      return nil unless image_id
      "https://images.igdb.com/igdb/image/upload/t_cover_big/#{image_id}.jpg"
    end
end
