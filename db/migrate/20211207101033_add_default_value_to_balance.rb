class AddDefaultValueToBalance < ActiveRecord::Migration[6.1]
  def change
    change_column :accounts, :balance, :float, :default => 0
  end
end
