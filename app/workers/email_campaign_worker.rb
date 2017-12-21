class EmailCampaignWorker
  include Sidekiq::Worker

  def perform(from, bcc, subject, content)
    # Do something
    if bcc.count < 100
      CampaignEmailMailer.action_send_email(from, bcc, subject, content).deliver_now!
    else
      bcc.to_enum.each_slice(100) do |small_bcc|
        CampaignEmailMailer.action_send_email(from, small_bcc, subject, content).deliver_now!
      end
    end
  end
end
