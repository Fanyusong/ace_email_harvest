class DeleteColumnInUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :uid
    remove_column :users, :tokens
    remove_column :users, :email_file
  end
end
