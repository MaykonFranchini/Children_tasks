class RemoveChildFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :transactions, :child, null: false, foreign_key: true
  end
end
