class CreateUserTitles < ActiveRecord::Migration[7.2]
  def change
    create_table :user_titles do |t|
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
