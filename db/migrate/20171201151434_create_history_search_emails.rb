class CreateHistorySearchEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :history_search_emails do |t|
      t.string :keyword
      t.datetime :search_time
      t.integer :match_result_number

      t.timestamps
    end
  end
end
