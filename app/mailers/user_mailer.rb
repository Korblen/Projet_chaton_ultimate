class UserMailer < ApplicationMailer
  default from: ENV["MAILJET_DEFAULT_FROM"]

  def welcome_email(user)
    #je récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    @url = application_url
    @signin_url = "https://projetchatonultimate-635bb9ecba1f.herokuapp.com/users/sign_in"

    #je permets d'envoyer l’e-mail en définissant le destinataire et le sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
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

  def order_to_admin(admin, order)
    @admin = admin
    @order = order
    @url = application_url + "dashboard/"
    @user = @order.user
    mail(to: @admin.email, subject: 'Une nouvelle commande vient d\'être effectuée !')
  end

  def order_to_user(order)
    @order = order
    @user = @order.user
    @order_url = application_url + 'orders/' + @order.id.to_s
    @item_url = application_url + 'items/'
    mail(to: @user.email, subject: 'Merci pour votre commande !')
  end

end

