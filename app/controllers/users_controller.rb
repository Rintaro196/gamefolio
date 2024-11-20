class UsersController < ApplicationController
  def index
    @users = User.with_attached_user_icon
  end

  def show
    @user = User.with_attached_user_icon.find(params[:id])
    @user_game_logs = @user.game_logs.includes(user_game: :game).with_attached_images.order(created_at: :desc).page(params[:page]).per(5)
    @top_5_genres = @user.top_5_genres
  end
end
