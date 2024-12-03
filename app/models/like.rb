class Like < ApplicationRecord
  belongs_to :user
  belongs_to :game_log

  has_one :notification, as: :notifiable, dependent: :destroy

  validates :user_id, uniqueness: { scope: :game_log_id }

end
