class ChangeTypeOfEmail < ActiveRecord::Migration[5.1]
  def change
    change_column :emails, :email_type, :string
  end
end
