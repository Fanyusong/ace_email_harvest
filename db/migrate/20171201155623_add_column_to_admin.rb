class AddColumnToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :phone, :string
    add_column :admins, :address, :string
    add_column :admins, :user_type, :integer
    add_column :admins, :birthday, :datetime
    add_column :admins, :confirmation_token, :string
    add_column :admins, :confirmed_at, :string
    add_column :admins, :confirmation_sent_at, :datetime
    add_column :admins, :unconfirmed_email, :datetime # Only if using reconfirmable
  end
end
