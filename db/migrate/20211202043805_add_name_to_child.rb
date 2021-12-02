class AddNameToChild < ActiveRecord::Migration[6.1]
  def change
    add_column :children, :first_name, :string
    add_column :children, :last_name, :string
    add_column :children, :date_of_birth, :date
  end
end
