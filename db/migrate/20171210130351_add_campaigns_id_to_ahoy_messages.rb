class AddCampaignsIdToAhoyMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :ahoy_messages, :campaign_id, :integer
  end
end
