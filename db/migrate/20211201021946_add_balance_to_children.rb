class AddBalanceToChildren < ActiveRecord::Migration[6.1]
  def change
    add_column :children, :balance, :float
    change_column_default :children, :balance, 0
  end
end
