class AddIgdbIdToGames < ActiveRecord::Migration[7.2]
  def change
    add_column :games, :igdb_id, :bigint
    add_index :games, :igdb_id, unique: true
  end
end
