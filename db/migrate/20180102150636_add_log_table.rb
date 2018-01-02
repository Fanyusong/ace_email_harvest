class AddLogTable < ActiveRecord::Migration[5.1]
  def change
    create_table :user_logs do |t|
      t.integer :user_id
      t.string  :action

      t.timestamps
    end
  end
end
