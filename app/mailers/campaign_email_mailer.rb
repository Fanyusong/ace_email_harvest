class CampaignEmailMailer < ApplicationMailer
  helper :email_campaign_mailer
  layout 'mailer'
  def action_send_email(from, to , subject, body )
    track extra: {campaign_id: 1, to: to}
    mail(from: from,
         to: to,
         subject: subject,
         body: body,
         content_type: "text/html")
  end
end