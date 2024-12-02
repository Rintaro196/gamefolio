class User < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games

  has_many :game_logs, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_logs, through: :likes, source: :game_log

  has_many :send_notifications, class_name: "Notification", foreign_key: "sender_id", dependent: :destroy
  has_many :recieved_notifications, class_name: "Notification", foreign_key: "reciever_id", dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy

  has_one_attached :user_icon, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

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

  def check_like(game_log)
    like_logs << game_log
  end

  def checkout_like(game_log)
    like_logs.destroy(game_log)
  end

  def check_like?(game_log)
    like_logs.include?(game_log)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "user_code" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "user_icon_attachment", "user_icon_blob" ]
  end

  def self.from_omniauth(auth)
    data = auth.info
    user = User.where(email: data["email"]).first

    unless user
      user = User.create(
        name: data["name"],
        email: data["email"],
        user_code: generate_user_code,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.generate_user_code
    loop do
      random_code = SecureRandom.alphanumeric(10)
      break random_code unless User.exists?(user_code: random_code)
    end
  end
end
