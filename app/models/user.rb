class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games
  has_many :game_logs
  has_one_attached :user_icon

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :user_code, presence: true
  validates :name, :user_code, length: { maximum: 64 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :profile, length: { maximum: 3000 }
  validates :user_icon, content_type: [ "image/png", "image/jpg", "image/jpeg" ],
                        size: { less_than: 5.megabytes, message: "画像サイズが大きすぎます(5MBまで)" }

  enum gender: { male: 0, female: 1, other: 2 }

  def own?(object)
    id == object&.user_id
  end
end
