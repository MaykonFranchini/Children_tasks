class AddDefaultReadToMessage < ActiveRecord::Migration[6.1]
  def change
    change_column_default :messages, :read, false
  end
end
