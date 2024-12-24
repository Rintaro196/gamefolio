class UserTitle < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: { scope: :user_id }
end
