class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game_log

  has_one :notification, as: :notifiable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 300 }
end
