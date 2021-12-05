class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :type
      t.string :description
      t.integer :amount
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
