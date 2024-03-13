class StaticPagesController < ApplicationController
  def contact
  end

  def send_contact
    UserMailer.visitor_contact_email(params).deliver_now
    UserMailer.admin_contact_email(params).deliver_now
  end
end
