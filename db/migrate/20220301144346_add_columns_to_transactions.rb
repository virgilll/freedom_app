class AddColumnsToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :rounded_amount, :float
    add_column :transactions, :coin_amount, :float
    add_column :transactions, :processed, :boolean
  end
end
