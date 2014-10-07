class ContactMailer < ActionMailer::Base
  # default from: "from@example.com"
  # default to: "andrea.trapp@gmail.com"
  # default to: "rebeccastrong50@gmail.com"
  default to: "jameshider@yahoo.co.uk"


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_email.subject
  #

    def contact_email(name, email, service, date, body)
    @name = name
    @email = email
    @service = service
    @date = date
    @body = body

    # mail to: email, subject: "Welcome to my website"
    mail(from: email, subject: "Message from your website")
  end

end
