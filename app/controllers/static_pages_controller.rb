class StaticPagesController < ApplicationController
  def contact
  end

  def send_contact
    UserMailer.visitor_contact_email(params).deliver_now
    UserMailer.admin_contact_email(params).deliver_now
    flash[:success] = "Votre message a bien été envoyé."
    redirect_to :contact
  end


end
