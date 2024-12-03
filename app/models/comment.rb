class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game_log
  
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 300 }

  after_create_commit :create_notification

  private

  def create_notification
    return if self.user_id == self.game_log.user_id
    Notification.create(
      sender_id: self.user_id,
      receiver_id: self.game_log.user_id,
      notifiable: self
    )
  end
end
