class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILJET_DEFAULT_FROM"]
  layout "mailer"

  def application_url
    if Rails.env.production?
      "https://projetchatonultimate-635bb9ecba1f.herokuapp.com/"
    else
      "http://localhost:3000/"
    end
  end

end

