class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_log, null: false, foreign_key: true

      t.timestamps

      t.index [:user_id, :game_log_id], unique: true
    end
  end
end
