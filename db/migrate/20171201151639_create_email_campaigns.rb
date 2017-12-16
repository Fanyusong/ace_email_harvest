class CreateEmailCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :email_campaigns do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer  :user_id
      t.string   :list_email
      t.timestamps
    end
    add_foreign_key :email_campaigns, :users, column: :user_id, primary_key: :id
  end
end
