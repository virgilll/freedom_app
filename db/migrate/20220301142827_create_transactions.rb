class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.date :transaction_date
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.references :coin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
