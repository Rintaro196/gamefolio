class NotificationsController < ApplicationController
    before_action :authenticate_user!

    def index
      @notifications = current_user.received_notifications.order(created_at: :desc).page(params[:page]).per(20)
      @notifications.where(checked: false).each do |notification|
        notification.update(checked: true)
      end
    end

    def delete_all
      current_user.received_notifications.destroy_all
      redirect_to notifications_path, status: :see_other, notice: "すべての通知を削除しました"
    end
end
