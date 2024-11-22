class Like < ApplicationRecord
  belongs_to :user
  belongs_to :game_log

  validates :user_id, uniqeness: { scope: :game_log_id }
end
