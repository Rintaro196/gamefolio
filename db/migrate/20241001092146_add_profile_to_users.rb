class AddProfileToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :profile, :text
    add_column :users, :twitter, :string
    add_column :users, :twitch,  :string
    add_column :users, :discord, :string
  end
end
