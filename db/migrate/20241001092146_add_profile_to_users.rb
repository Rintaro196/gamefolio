class AddProfileToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :profile, :text
    add_column :users, :twitter, :string, null: true
    add_column :users, :twitch,  :string, null: true
    add_column :users, :discord, :string, null: true

    add_index :users, :twitter, unique: true, where: "twitter IS NOT NULL"
    add_index :users, :twitch, unique: true, where: "twitch IS NOT NULL"
    add_index :users, :discord, unique: true, where: "discord IS NOT NULL"
  end
end
