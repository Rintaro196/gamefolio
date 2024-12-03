class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @game_log = GameLog.find(params[:game_log_id])
    current_user.transaction do
      current_user.check_like(@game_log)
      create_like_notification(current_user, @game_log)
    end
  end

  def destroy
    @game_log = current_user.likes.find(params[:id]).game_log
    current_user.checkout_like(@game_log)
  end

  private

  def create_like_notification(user, game_log)
    return if user.id == game_log.user_id
    like = Like.find_by(user: user, game_log: game_log) 
    Notification.create(
      sender_id: user.id,
      receiver_id: game_log.user_id,
      notifiable: like
    )
  end
end
