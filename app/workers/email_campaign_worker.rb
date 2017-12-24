class EmailCampaignWorker
  include Sidekiq::Worker

  def perform(array, from, subject, content)

    # Do something
    if array.count < 100
      CampaignEmailMailer.action_send_email(from, array, subject, content).deliver_now!
    else
      array.to_enum.each_slice(100) do |small_bcc|
        CampaignEmailMailer.action_send_email(from, small_bcc, subject, content).deliver_later!
      end
    end
  end

end
