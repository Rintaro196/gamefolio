class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :game_logs, dependent: :destroy

  validates :memo, length: { maximum: 1000 }

  enum status: { incomplete: 0, completed: 1, playing_now: 3 }

  def game_title_method
    game.game_title
  end

  def total_play_time
    game_logs.sum(:play_time)
  end

  def total_spnding_amount
    game_logs.sum(:spending_amount)
  end
end
