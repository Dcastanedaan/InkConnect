class ChangeRoleInUsers < ActiveRecord::Migration[8.1]
  def up
    remove_column :users, :role
    add_column :users, :role, :integer, default: 0
  end

  def down
    remove_column :users, :role
    add_column :users, :role, :string
  end
end
