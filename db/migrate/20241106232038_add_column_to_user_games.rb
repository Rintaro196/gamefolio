class AddColumnToUserGames < ActiveRecord::Migration[7.2]
  def change
    add_column :user_games, :memo, :text
  end
end
