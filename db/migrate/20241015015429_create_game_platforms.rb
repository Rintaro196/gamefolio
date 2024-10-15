class CreateGamePlatforms < ActiveRecord::Migration[7.2]
  def change
    create_table :game_platforms do |t|
      t.references :game, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true
      t.index [:game_id, :platform_id], unique: true
      t.timestamps
    end
  end
end
