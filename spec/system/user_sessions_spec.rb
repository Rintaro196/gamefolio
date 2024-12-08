require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let!(:user) { create(:user) }

  describe "ログイン前" do

    context "ログイン" do
      
      before do
        visit "users/sign_in"
      end

      it "正常にログインできる" do
        fill_in "メールアドレス", with: user.email
        fill_in "復活の呪文", with: user.password
        click_button "スタート"
        expect(page).not_to have_selector("form[aria-busy='true']")
        expect(current_path).to eq user_path(user)
      end

      it "メールアドレスが一致しないとログインできない" do
        fill_in "メールアドレス", with: "rantekun@rantekun.com"
        fill_in "復活の呪文", with: user.password
        click_button "スタート"
        expect(page).to have_content("ユーザーが見つかりませんでした")
        expect(current_path).to eq "/users/sign_in"
      end

      it "パスワードが一致しないとログインできない" do
        fill_in "メールアドレス", with: user.email
        fill_in "復活の呪文", with: "password"
        click_button "スタート"
        expect(page).to have_content("メールアドレスまたは呪文が違います")
        expect(current_path).to eq "/users/sign_in"
      end
    end
  end

  describe "ログイン後" do
    before do
      sign_in user
    end

    context "ログアウト" do 
      it "正常にログアウトできる" do
        visit root_path
        click_button "ログアウト"
        expect(page).to have_content("ログアウトしました")
      end
    end
  end
end
