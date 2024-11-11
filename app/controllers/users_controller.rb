class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_game_logs = @user.game_logs.order(created_at: :desc).limit(10)
    @top_5_genres = @user.top_5_genres
  end
end
