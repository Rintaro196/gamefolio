class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :game_logs, dependent: :destroy

  enum status: { incomplete: 0, completed: 1 }

  def game_title_method
    game.game_title
  end
end
