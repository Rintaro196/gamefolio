class GameLog < ApplicationRecord
  belongs_to :user
  belongs_to :user_game
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  validates :title, presence: true, length: { maximum: 140 }
  validates :body, length: { maximum: 1000 }
  validates :play_time, :spending_amount, numericality: { only_integer: true, in: 0 .. 999999999 }, allow_nil: true
  validates :images, content_type: [ "image/png", "image/jpg", "image/jpeg" ],
                     limit: { max: 4, message: "画像は４枚まで" },
                     size: { less_than: 5.megabytes, message: "画像サイズが大きすぎます(5MBまで)" }

  after_create :level_up_by_game_log

  def self.ransackable_attributes(auth_object = nil)
    [ "title", "body" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "user", "user_game", "game", "images_attachment", "images_blob" ]
  end

  private

  def level_up_by_game_log
    user_level = user.level

    if user.last_level_up_by_log.nil? || user.last_level_up_by_log.in_time_zone.to_date != Time.zone.today
      user.transaction do
        user.increment!(:level) if user.level < 99999
        user.increment!(:gem, 10)
        user.update!(last_level_up_by_log: Time.current)
      end
    end
  end
end
