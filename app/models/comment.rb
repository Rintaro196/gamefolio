class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game_log

  validates :body, presence: true, length: { maximum: 300 }
end
