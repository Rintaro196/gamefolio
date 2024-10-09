require 'httparty'

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
        headers = {
          "Client-ID" => ENV['CLIENT_ID'],
          "Authorization" => "Bearer #{ENV['ACCESS_TOKEN']}"
        }
    
        query = <<-QUERY
          fields name, genres.name, platforms.name, cover.url, release_dates.human, release_dates.region;
          where name ~ "#{title}";
        QUERY
    
        response = HTTParty.post(url, headers: headers, body: query)

        JSON.parse(response.body)
    end
end
