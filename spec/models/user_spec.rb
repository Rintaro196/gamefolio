require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションチェック" do

    it "nullだとユーザー登録できないこと" do
      user = user.new
    end
    it "user_codeバリデーション" do end
    it "ageバリデーション" do end
    it "profileバリデーション" do end
    it "アカウントバリデーション" do end
    it "user_iconバリデーション" do end
  end
end
