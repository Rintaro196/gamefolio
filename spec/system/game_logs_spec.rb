require 'rails_helper'

RSpec.describe "GameLogs", type: :system do
  let!(:user) { create(:user) }
  let!(:game) { create(:game) }
  let!(:user_game) { create(:user_game, user: user, game: game) }
  let!(:game_log) { create(:game_log, user: user, user_game: user_game) }

  describe "ログイン前" do

    it "ゲーム一覧が見れる" do
      visit game_logs_path
      expect(page).to have_content(game_log.title)
      expect(page).to have_content(game.game_title)
    end

    it "ゲームログ詳細が見れる" do
      visit game_log_path(game_log)
      expect(page).to have_content(game_log.title)
      expect(page).to have_content(game_log.spending_amount)
    end

    it "ゲームログ作成ができない" do
      visit new_game_log_path
      expect(current_path).to eq "/users/sign_in"
      expect(page).to have_content("ログインまたは登録が必要です")
    end

    it "ゲームログ編集ができない" do
      visit edit_game_log_path(game_log)
      expect(current_path).to eq "/users/sign_in"
      expect(page).to have_content("ログインまたは登録が必要です")
    end
  end

  describe "ログイン後" do
    before do
      sign_in user
    end

    context "ゲームログ作成" do
    end
  end
end
