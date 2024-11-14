class AddLevelsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :level, :integer, null: false, default: 1
    add_column :users, :gem, :integer, null:false, default: 0
    add_column :users, :last_level_up_by_log, :datetime
  end
end
