class StaticPagesController < ApplicationController
  def contact
  end

  def send_contact
    ContactMailer.contact(params[:name], params[:email], params[:message]).deliver
 end
end
