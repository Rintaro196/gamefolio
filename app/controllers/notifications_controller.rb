class NotificationsController < ApplicationController
    before_action :authenticate_user!

    def index
      @notifications = current_user.recieved_notifications.order(created_at: :desc).page(params[:page]).per(20)
      @notifications.where(checked: false).each do |notification|
        notification.update(checked: true)
      end
    end

    def destory
      @notifications = current_user.notifications.destroy_all
    end
end
