namespace :igdb_access_token do
  desc "IGDB APIで検索するためのaccess_tokenを取得"
    task get_access_token: :environment do
        @access_token = Token.find_by(id: 1) || Token.new
        client_id = ENV["CLIENT_ID"]
        client_secret = ENV["CLIENT_SECRET"]

        response = HTTParty.post("https://id.twitch.tv/oauth2/token?client_id=#{client_id}&client_secret=#{client_secret}&grant_type=client_credentials")

        if response.success?
          @access_token.access_token = response.parsed_response["access_token"]
          @access_token.save
        else
          puts "トークン取得に失敗しました: #{response.body}"
        end
    end
end
