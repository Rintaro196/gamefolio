class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :game_logs, dependent: :destroy

  enum status: { incomplete: 0, completed: 1 }

  def game_title
    game.game_title
  end

  def game_cover
    game.cover_url
  end

  def total_play_time
    game_logs.sum(:play_time)
  end

  def total_spnding_amount
    game_logs.sum(:spending_amount)
  end
end
