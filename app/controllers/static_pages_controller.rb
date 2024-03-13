class StaticPagesController < ApplicationController
  def contact
  end

  def send_contact
    UserMailer.contact_email(params).deliver_now
  end
end
