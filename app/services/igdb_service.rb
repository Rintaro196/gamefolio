require "httparty"

class IgdbService
    def initialize
        @client_id = ENV["CLIENT_ID"]
        @client_secret = ENV["CLIENT_SECRET"]
        token = Token.find_by(id: 1)
        @access_token = token.access_token
        @headers = {
          "Client-ID" => @client_id,
          "Authorization" => "Bearer #{@access_token}"
        }
    end

    # トークン取得処理（仮）
    # def get_access_token
    #    response = HTTParty.post("https://id.twitch.tv/oauth2/token?client_id=#{@client_id}&client_secret=#{@client_secret}&grant_type=client_credentials")
    #    response.parsed_response["access_token"]
    # end

    def search_game(title)
        url = "https://api.igdb.com/v4/games"

        query = "search \"#{title}\"; fields name, genres.name, platforms.name, cover.url, game_localizations.region, game_localizations.cover.image_id, game_localizations.name; where category = (0,8,9) & version_parent = null;"

        response = HTTParty.post(url, headers: @headers, body: query)

        games = JSON.parse(response.body)

        games.map { |game| choose_japanese_localization(game) }
    end

    def choose_japanese_localization(game_data)
        japanese_localization = game_data["game_localizations"]&.find { |loc| loc["region"] == 3 }

        if japanese_localization
          {
            igdb_id: game_data["id"],
            name: japanese_localization["name"] || game_data["name"],
            cover_url: japanese_localization["cover"] ? cover_image_url(japanese_localization["cover"]["image_id"]) : game_data.dig("cover", "url"),
            genres: game_data["genres"]&.map { |genre| genre["name"] } || [],
            platforms: game_data["platforms"]&.map { |platform| platform["name"] } || []
        }
        else
          {
            igdb_id: game_data["id"],
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
