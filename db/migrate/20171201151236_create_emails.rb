class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.integer :email_type
      t.string  :email_address
      t.timestamps
    end
  end
end
