class ChangeTypeOBirthdayUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :birthday, :date
    change_column :admins, :birthday, :date
  end
end
