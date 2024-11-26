require 'rails_helper'

RSpec.describe GameLog, type: :model do
  describe "バリデーションチェック" do

    it "バリデーションが機能しているか" do
      game_log = build(:game_log)
      expect(game_log).to be_valid
      expect(game_log.errors).to be_empty
    end

    it "タイトルがない場合invalid" do
      no_title = build(:game_log, title: "")
      expect(no_title).to be_invalid
      expect(no_title.errors).to be_of_kind(:title, :blank)
    end

    it "タイトルが141文字以上の場合invalid" do
      long_title = build(:game_log, title: "a" * 141 )
      expect(long_title).to be_invalid
      expect(long_title.errors).to be_of_kind(:title, :too_long)
    end

    it "無効な数字の場合invalid" do
      wrong_number = build(:game_log, play_time: 0.1)
      expect(wrong_number).to be_invalid
      expect(wrong_number.errors).to be_of_kind(:play_time, :not_an_integer)
    end

    it "課金額が多すぎる場合invalid" do
      too_big_amount = build(:game_log, spending_amount: 1000000000000)
      expect(too_big_amount).to be_invalid
      expect(too_big_amount.errors).to be_of_kind(:spending_amount, :in)
    end

  end
end
