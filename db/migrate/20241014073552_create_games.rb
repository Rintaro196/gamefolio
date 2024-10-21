class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :game_title, null: false
      t.string :cover_url
      t.timestamps
    end
  end
end
