class ApplicationController < ActionController::Base
  before_action :set_notifications

  private

  def set_notifications
    if current_user.present?
      @unchecked_notifications = current_user.notifications.where(checked: false)
      @notification_count = @unchecked_notifications.count
    end
  end
  
end
