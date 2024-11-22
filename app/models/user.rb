class User < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games
  has_many :game_logs, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :user_icon, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :user_code, presence: true
  validates :name, :user_code, length: { maximum: 64 }
  validates :age, numericality: { only_integer: true, in: 0 .. 1000000000 }, allow_nil: true
  validates :profile, length: { maximum: 300 }

  validates :user_icon, content_type: [ "image/png", "image/jpg", "image/jpeg" ],
                        size: { less_than: 5.megabytes, message: "画像サイズが大きすぎます(5MBまで)" }

  validates :level, presence: true, numericality: { only_integer: true, in: 1..9999 }
  validates :gem, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum gender: { male: 0, female: 1, other: 2 }

  def own?(object)
    id == object&.user_id
  end

  def top_5_genres
    genres = games.joins(:genres)
                  .group("genres.name")
                  .order("count(genres.name) DESC")
                  .limit(5)
                  .count("genres.name")

    genres.transform_keys { |name| I18n.t("genres.#{name}", default: name) }
  end
end
