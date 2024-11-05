class GameLog < ApplicationRecord
  belongs_to :user
  belongs_to :user_game
  has_many_attached :images

  validates :title, presence: true, length: { maximum: 140 }
  validates :body, length: { maximum: 3000 }
  validates :play_time, :spending_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :images, content_type: { in: "image/png", "image/jpg", "image/jpeg", message: "無効なファイル形式です" },
                     limit: { max: 4, message: "画像は４枚まで" },
                     size: { less_than: 5.megabytes, message: "画像サイズが大きすぎます(5MBまで)" }
end
