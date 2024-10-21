class CreateGameGenres < ActiveRecord::Migration[7.2]
  def change
    create_table :game_genres do |t|
      t.references :game, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.index [ :game_id, :genre_id ], unique: true
      t.timestamps
    end
  end
end
