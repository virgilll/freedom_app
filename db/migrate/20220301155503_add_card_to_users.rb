class AddCardToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :card_info, :integer
  end
end
