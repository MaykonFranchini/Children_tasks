class RemoveBalanceFromChild < ActiveRecord::Migration[6.1]
  def change
    remove_column :children, :balance
  end
end
