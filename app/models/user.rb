class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :user_code, presence: true
  validates :name, :age, length: { maximum: 255 }
  validates :user_code, length: { maximum: 64 }

  enum gender: { male: 0, female: 1, other: 2 }
end
