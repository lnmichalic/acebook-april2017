class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, limit: 150
    change_column_null :users, :name, false
    add_index :users, :name
  end
end
