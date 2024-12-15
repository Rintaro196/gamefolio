class UserTitlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_titles = current_user.user_titles.order(created_at: :desc)
  end

  def get_title
    user = current_user
    gemini = GeminiService.new(user)
    @user_title = gemini.get_user_title
    puts @user_title
  end
end
