class Notification < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :reciever, class_name: "User", foreign_key: "receiver_id"
  belongs_to :notifiable, polymorphic: true

  def comment?(notification)
    notification.notifiable_type == comment
  end

  def like?(notification)
    notification.notifiable_type == like
  end
end
