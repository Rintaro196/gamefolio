class CreateGameLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :game_logs do |t|
      t.string :title, null: false
      t.text :body
      t.integer :play_time
      t.integer :spending_amount
      t.references :user, null: false, foreign_key: true
      t.references :user_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
