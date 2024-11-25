class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :game_log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
