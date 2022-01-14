class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
