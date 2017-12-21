class AddEmailFileToEmailCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :email_campaigns, :file, :string
  end
end
