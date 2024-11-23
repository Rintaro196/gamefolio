class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @game_log = GameLog.find(params[:game_log_id])
    current_user.check_like(@game_log)
  end

  def destroy
    @game_log = current_user.likes.find(params[:id]).game_log
    current_user.checkout_like(@game_log)
  end
end
