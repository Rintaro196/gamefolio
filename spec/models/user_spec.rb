require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションチェック" do

    it "バリデーションが機能しているか" do
      user = build(:user)
      expect(user).to be_valid
      expect(user.error).to be_empty
    end

    it "名前がない場合invalid" do
      no_name = build(:user, name: "")
      expect(no_name).to be_invalid
      expect(no_name.errors[:name]).to eq["を入力してください"]
    end

    it "ユーザーIDが被らない場合登録できる" do
      user = create(:user)
      other = build(:user, user_code: "robo_rantekun")
      expect(other).to be_valid
      expect(user.error).to be_empty
    end
    
    it "重複する場合invalied" do
      user = create(:user)
      other = build(:user, user_code: "rantekun")
      expect(other).to in_valid
      expect(other.errors[:user_code]).to eq["は既に使用されています"]
    end
    
    it "文字数が長すぎる場合invalied" do
      user = build(:user, name: "a" * 70)
      expect(user).to in_valied
    end
    
    it "無効な数字の場合invalied" do
      user = build(:user, age: 0.1)
      expect(user).to in_valid
      expect(user.errors[:age]).to eq["は数値で入力してください"]
    end
    
  end
end
