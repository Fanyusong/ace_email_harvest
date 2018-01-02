class DeleteColumnInAdmin < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :confirmation_token
    remove_column :admins, :confirmed_at
    remove_column :admins, :confirmation_sent_at
    remove_column :admins, :unconfirmed_email
  end
end
