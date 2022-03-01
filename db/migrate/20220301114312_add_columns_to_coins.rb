class AddColumnsToCoins < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :ticker, :string
    add_column :coins, :description, :string
    add_column :coins, :current_price, :float
  end
end
