class GameLog < ApplicationRecord
  belongs_to :user
  belongs_to :user_game
  has_many_attached :images

  validates :title, presence: true, length: { maximum: 140 }
  validates :body, length: { maximum: 3000 }
  validates :play_time, :spending_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :images, attachment: { purge: true, content_type: %r{\Aimage/(png|jpeg|jpg)\Z} }
end
