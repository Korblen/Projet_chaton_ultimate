class UserMailer < ApplicationMailer
  default from: ENV["MAILJET_DEFAULT_FROM"]

  def welcome_email(user)
    #je récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #je définis une variable @url qu'on utilisera dans la view d’e-mail
    ########### à définir avant de basculer sur Heroku #####################################
    @url = default_url_options

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
end

