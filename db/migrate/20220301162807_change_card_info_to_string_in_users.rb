class ChangeCardInfoToStringInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :card_info, :bigint
  end
end
