class SearchGameForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :title, :string

    validates :title, presence: true, length: { maximum: 255 }

    # def search_game(game_title)
    #  client_id = ENV['CLIENT_ID']
    #  access_token = ENV['ACCESS_TOKEN']

    #  uri = "https://api.igdb.com/v4/games"

    #  headers = {
    #      "Client-ID" => "#{client_id}",
    #      "Authorization" => "Bearer #{access_token}"
    #  }

    #  query = 'fields name, genres.name, release_dates.human; where name = "#{game_title}";'
    #  @response = HTTParty.post(url, headers: headers, body: query)
    # end
end
