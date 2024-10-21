class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :user_code, presence: true
  validates :name, :user_code, length: { maximum: 64 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  enum gender: { male: 0, female: 1, other: 2 }
end
