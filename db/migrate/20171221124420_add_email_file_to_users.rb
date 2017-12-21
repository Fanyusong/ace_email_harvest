class AddEmailFileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email_file, :json
  end
end
