require 'rails_helper'

RSpec.describe "Users", type: :system do
  
  let(:user) { create(:user) }

  describe "ログイン前" do
    context "ユーザー新規登録" do

      it "フォームの入力値が正常の場合登録できる" do
        visit "users/sign_up"
        expect{
          fill_in "ユーザーネーム", with: "テスト太郎"
          fill_in "ユーザーID", with: "test_taro"
          fill_in "メールアドレス", with: "test@test.com"
          fill_in "復活の呪文", with: "test@taro"
          fill_in "復活の呪文再詠唱", with: "test@taro"
          click_button "スタート"
        }.to change { User.count }.by 1
        expect(page).to have_content("テスト太郎")
      end

      it "メールアドレスが空の場合登録できない" do
        visit "users/sign_up"
        fill_in "ユーザーネーム", with: "テスト太郎"
        fill_in "ユーザーID", with: "test_taro"
        fill_in "メールアドレス", with: ""
        fill_in "復活の呪文", with: "test@taro"
        fill_in "復活の呪文再詠唱", with: "test@taro"
        click_button "スタート"
        expect(page).to have_content("を入力してください")
        expect(current_path).to eq "/users/sign_up"
      end

      it "同じメールアドレスの場合登録できない" do
        visit "users/sign_up"
        fill_in "ユーザーネーム", with: "テスト太郎"
        fill_in "ユーザーID", with: "test_taro"
        fill_in "メールアドレス", with: user.email
        fill_in "復活の呪文", with: "test@taro"
        fill_in "復活の呪文再詠唱", with: "test@taro"
        click_button "スタート"
        expect(page).to have_content("は既に使用されています")
        expect(current_path).to eq "/users/sign_up"
      end

      it "パスワードが一致しない場合登録できない" do
        visit "users/sign_up"
        fill_in "ユーザーネーム", with: "テスト太郎"
        fill_in "ユーザーID", with: "test_taro"
        fill_in "メールアドレス", with: "test@test.com"
        fill_in "復活の呪文", with: "test@taro"
        fill_in "復活の呪文再詠唱", with: "testtaro"
        click_button "スタート"
        expect(page).to have_content("呪文が一致していません")
        expect(current_path).to eq "/users/sign_up"
      end
    end
  end

end
