class CampaignEmailMailer < ApplicationMailer
  layout 'mailer'
  def action_send_email(from, to , subject, body, email_campaign_id )
    track extra: {campaign_id: email_campaign_id, to: to}
    track click: true
    mail(from: from,
         to: to,
         subject: subject,
         body: body,
         content_type: "text/html")
  end
end