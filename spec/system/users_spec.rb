require 'rails_helper'

RSpec.describe "Users", type: :system do
  
  describe "ログイン前" do
    context "ユーザー新規登録" do
      it "フォームの入力値が正常の場合登録できる" do
        visit "users/sign_up"
        expect{
          fill_in "Email", with: "test@test.com"
          fill_in "name", with: "テスト太郎"
          fill_in "user_code", with: "test_taro"
          click_button "スタート"
      }.to change { User.count }.by(1)
      expect(page).to have_content("テスト太郎")
      end
      #it "メールアドレスが空の場合登録できない" do
      #end
      #it "同じメールアドレスの場合登録できない" do
      #end
      #it "パスワードが一致しない場合登録できない" do
      #end
    end
  end

end
