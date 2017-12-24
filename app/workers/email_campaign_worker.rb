class EmailCampaignWorker
  include Sidekiq::Worker

  def perform(array, from, subject, content)
    # Do something
    array.each do |to|
      CampaignEmailMailer.action_send_email(from, to, subject, content).deliver_later!
    end
  end

end
