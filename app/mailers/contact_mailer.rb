class ContactMailer < ActionMailer::Base
  # default from: "from@example.com"
  default to: "andrea.trapp@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_email.subject
  #

    def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    # mail to: email, subject: "Welcome to my website"
    mail(from: email, subject: "Message from your website")
  end
  
end
