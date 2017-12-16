class AddRefKeyToHistorySearchEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :history_search_emails, :user_id, :integer
    add_foreign_key :history_search_emails, :users, column: :user_id, primary_key: :id
  end
end
