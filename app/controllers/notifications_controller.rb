class NotificationsController < ApplicationController
    before_action :authenticate_user!

    def index
      @notifications = current_user.received_notifications.order(created_at: :desc).page(params[:page]).per(20)
      @notifications.where(checked: false).each do |notification|
        notification.update(checked: true)
      end 
    end

    def destory
      @notifications = current_user.notifications.destroy_all
      redeirect_to notifications_path
    end
end
