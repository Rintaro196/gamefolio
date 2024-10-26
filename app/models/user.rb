class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games
  has_many :game_logs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :user_code, presence: true
  validates :name, :user_code, length: { maximum: 64 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :profile, length: { maximum: 3000 }

  enum gender: { male: 0, female: 1, other: 2 }

  def own?(object)
    id == object&.user_id
  end
end
