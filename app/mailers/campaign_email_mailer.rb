class CampaignEmailMailer < ApplicationMailer
  layout 'mailer'
  def action_send_email(from, to , subject, body )
    track extra: {campaign_id: 1}
    mail(from: from,
         bcc: to,
         subject: subject,
         body: body)
  end
end
