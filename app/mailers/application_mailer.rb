class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILJET_DEFAULT_FROM"]
  layout "mailer"

  def application_url
    if Rails.env.production?
      "https://bit.ly/projet_chaton_ultimate"
    else
      "http://localhost:3000/"
    end
  end

  def visitor_contact_email(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @url = application_url
    mail(to: "annie.herieau@gmail.com", subject: 'Catysfaction: Nous avons reçu votre message')
  end

  def admin_contact_email(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @url = application_url
    mail(to: "annie.herieau@gmail.com", subject: 'Catysfaction: Nouveau contact')
  end

end

