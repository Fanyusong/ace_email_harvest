class UserMailer < ApplicationMailer
    # Action send email in client page
    def action_send_email(options)
      mail(to: options[:to],
           cc: options[:cc],
           bcc: options[:bcc],
           from: options[:from],
           subject: options[:subject],
           body: options[:body],
           content_type: 'text/html')
    end
    # Send email when publish project
    def send_email_welcome(user)
      mail(
          to: user,
          subject: "Welcome to ACE",
          body: "Test email",
          content_type: 'text/html'
      )
    end
end
