class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  enum status: { incomplete: 0, completed: 1 }
end
