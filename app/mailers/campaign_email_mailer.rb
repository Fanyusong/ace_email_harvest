class CampaignEmailMailer < ApplicationMailer
  layout 'mailer'
  def action_send_email(from, to , subject, body )
    mail(from: from,
         bcc: to,
         subject: subject,
         body: body)
  end
end
