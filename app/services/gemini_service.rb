require "httparty"

class GeminiService
    def initialize(user)
        @user_games = user.games.pluck(:game_title)

        @user_top_5_genres = user.games.joins(:genres)
                            .select("genres.name")
                            .group("genres.name")
                            .limit(5)
                            .pluck(:name)

        @gemini_api_key = ENV["GEMINI_API_KEY"]

        @number = rand(1..10)
    end

    def get_user_title
        url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=#{@gemini_api_key}"

        headers = {
          "Content-Type" => "application/json"
        }

        body = {
          contents: [ {
              parts: [ {
                text: "ユーザーが登録したゲーム情報を基に、そのユーザーにふさわしい称号を考えてください。\n
                  #以下はユーザーが登録しているゲーム情報です。\n
                  ゲームタイトル：#{@user_games.join(",")}\n
                  もっとも遊んでいるゲームジャンル上位5つ:#{@user_top_5_genres.join(",")}\n
                  #条件\n
                  1.ユーザーのゲーム情報をもとに創造的な称号を10個考えてください。\n
                  2.公序良俗に反する言葉は使わないでください。\n
                  3.#{@number}番目に考えた称号のみを出力してください。\n
                  4.連続して同じ情報が与えられた場合、以前と違う称号を考えてください。
                "
              } ]
          } ]
        }

        response = HTTParty.post(url, headers: headers, body: body.to_json)
        response["candidates"][0]["content"]["parts"][0]["text"]
    end
end
