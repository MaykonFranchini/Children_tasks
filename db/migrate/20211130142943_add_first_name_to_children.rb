class AddFirstNameToChildren < ActiveRecord::Migration[6.1]
  def change
    add_column :children, :first_name, :string
    add_column :children, :last_name, :string
    add_column :children, :age, :integer
    add_column :children, :balance, :float
    add_reference :children, :users, null: false, foreign_key: true
  end
end
