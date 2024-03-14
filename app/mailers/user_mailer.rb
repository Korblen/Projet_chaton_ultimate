class UserMailer < ApplicationMailer
  default from: ENV["MAILJET_DEFAULT_FROM"]

  def welcome_email(user)
    #je récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    @url = application_url
    @signin_url = "<a href='https://projetchatonultimate-635bb9ecba1f.herokuapp.com/users/sign_in'>Catysfaction/signin</a>"

    #je permets d'envoyer l’e-mail en définissant le destinataire et le sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def order_alert(admin, user)
    @admin = admin
    @user = user
    ############ à définir une fois le paiement stripe fait (.order) #######################
    @order = @user.order.last if @user.order.any?
    mail(to: @admin.email, subject: 'Une nouvelle commande vient d\'être effectuée !')
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

