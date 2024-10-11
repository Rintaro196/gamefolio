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
        access_token = Token.access_token.find_by(id: 1)
        headers = {
          "Client-ID" => ENV["CLIENT_ID"],
          "Authorization" => "Bearer #{access_token}"
        }

        query = "search \"#{title}\"; fields name, genres.name, platforms.name, cover.url, game_localizations.region, game_localizations.cover.image_id, game_localizations.name; where category = (0,2,4,8,9,10,11) & version_parent = null;"

        response = HTTParty.post(url, headers: headers, body: query)

        JSON.parse(response.body)
    end
end
