require "httparty"

class GeminiService
    def initialize(user)
        @user_games = user.games.pluck(:game_title)

        @user_top_5_genres = user.games.joins(:genres)
                            .select("genres.name")
                            .group("genres.name")
                            .limit(5)
                            .pluck(:name)

        @user_game_counts = user.games.count("games.game_title")

        @gemini_api_key = ENV["GEMINI_API_KEY"]
    end

    def get_user_title
        url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=#{@gemini_api_key}"

        headers = {
          "Content-Type" => "application/json"
        }

        body = {
          contents: [{
              parts: [{
                text: "ユーザーが登録したゲーム情報を基に、そのユーザーにふさわしい称号を考えてください。\n
                  #以下はユーザーが登録しているゲーム情報です。\n
                  ゲームタイトル：#{@user_games.join(",")}\n
                  もっとも遊んでいるゲームジャンル上位5つ:#{@user_top_5_genres.join(",")}\n
                  登録したゲームの数:#{@user_game_counts}\n
                  #条件\n
                  1.そのゲームまたは遊んでいるジャンルの特徴を反映した創造的な称号を考えてください。\n
                  2.反映させる特徴は、提示したゲーム情報の一部または全部のいずれかにしてください。\n
                  3.公序良俗に反する言葉は使わないでください。\n
                  4.称号のみ出力してください。
                "
              }]
          }]
        }

        response = HTTParty.post(url, headers: headers, body: body.to_json)
        response["candidates"][0]["content"]["parts"][0]["text"]
    end
end