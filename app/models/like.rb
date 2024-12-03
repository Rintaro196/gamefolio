class Like < ApplicationRecord
  belongs_to :user
  belongs_to :game_log

  has_one :notification, as: :notifiable, dependet: :destroy

  validates :user_id, uniqueness: { scope: :game_log_id }

  after_create_commit :create_notification

  private

  def create_notification
    return if self.user_id == self.game_log.user_id
    Notification.create(
      sender_id: self.user_id,
      reciever_id: self.game_log.user_id,
      notifiable: self
    )
  end

end
