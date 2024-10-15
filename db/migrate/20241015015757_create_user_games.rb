class CreateUserGames < ActiveRecord::Migration[7.2]
  def change
    create_table :user_games do |t|
      t.integer :status, null: false, default: 0, limit: 1
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.index [:user_id, :game_id], unique: true
      t.timestamps
    end
  end
end
