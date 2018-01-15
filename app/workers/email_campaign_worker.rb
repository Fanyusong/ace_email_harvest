class EmailCampaignWorker
  include Sidekiq::Worker

  def perform(array, from, subject, content, email_campaign_id)
    # Do something
    return if array.empty?
    if array.count < 100
      array.each do |to|
        CampaignEmailMailer.action_send_email(from, to, subject, content, email_campaign_id).deliver_later!
      end
    end
    if array.count > 100
      array.to_enum.each_slice(100) do |bcc|
        bcc.each do |to|
          CampaignEmailMailer.action_send_email(from, to, subject, content, email_campaign_id).deliver_later!
        end
      end
    end
  end
end
