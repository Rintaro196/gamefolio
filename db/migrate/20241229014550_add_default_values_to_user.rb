class AddDefaultValuesToUser < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :name, "名無しのゲーマー"
  end
end
