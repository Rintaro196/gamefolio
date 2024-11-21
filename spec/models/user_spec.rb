require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションチェック" do
    let(:user) { user: user }

    it "空だとinvalied" do
      user.name = ""
      expect(user).not_to be_valid
    end
    #it "重複するとinvalied" do end
    #it "文字数が長すぎるとinvalied" do end
    #it "無効な数字だとinvalied" do end
    #it "" do end
  end
end
