class AddProfileTitleToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :profile_title, :string
  end
end
