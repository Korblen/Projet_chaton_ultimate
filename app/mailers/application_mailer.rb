class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILJET_DEFAULT_FROM"]
  layout "mailer"

  def visitor_contact_email(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @url = default_url_options
    mail(to: "annie.herieau@gmail.com", subject: 'Catysfaction: Nous avons reçu votre message')
  end

  def admin_contact_email(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @url = default_url_options
    mail(to: "annie.herieau@gmail.com", subject: 'Catysfaction: Nouveau contact')
  end

end

