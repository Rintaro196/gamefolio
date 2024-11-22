class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    game_log = GaneLog.find(params[:game_log_id])
    current_user.check_like(game_log)
    redirect_back fallback_location: game_logs_path
  end

  def destory
    game_log = current_user.likes.find(params[:id]).game_log
    current_user.checkout_like(game_log)
    redirect_back fallback_location: game_logs_path
  end
end
