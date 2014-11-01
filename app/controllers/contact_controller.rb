class ContactController < ApplicationController

  def send_mail
    name = params[:name]
    email = params[:email]
    service = params[:service]
    date = params[:datepicker]
    body = params[:comments]

    if email!=""
      ContactMailer.contact_email(name, email, service, date, body).deliver
      redirect_to root_path, notice: 'Message sent'
    else
      redirect_to contact_path
    end
  end

end
