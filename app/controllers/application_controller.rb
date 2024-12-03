class ApplicationController < ActionController::Base
  before_action :set_notifications

  private

  def set_notifications
    if current_user.present?
      @unchecked_notifications = Notification.where(receiver_id: current_user.id, checked: false)
      @notification_count = @unchecked_notifications.count
    end
  end

end
