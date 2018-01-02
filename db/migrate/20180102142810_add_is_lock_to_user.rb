class AddIsLockToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_lock, :boolean, default: false
  end
end
