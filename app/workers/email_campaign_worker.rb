class EmailCampaignWorker
  include Sidekiq::Worker

  def perform(email_campaign_id, from, subject, content)

    # Do something
    email_campaign = EmailCampaign.find(email_campaign_id)
    puts email_campaign
    bcc = email_campaign.read_csv
    if bcc.count < 100
      CampaignEmailMailer.action_send_email(from, bcc, subject, content).deliver_now!
    else
      bcc.to_enum.each_slice(100) do |small_bcc|
        CampaignEmailMailer.action_send_email(from, small_bcc, subject, content).deliver_later!
      end
    end
  end

end
