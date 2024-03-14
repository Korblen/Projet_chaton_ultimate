class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILJET_DEFAULT_FROM"]
  layout "mailer"

  def application_url
    if Rails.env.production?
      "https://bit.ly/catysfaction"
    else
      "http://localhost:3000/"
    end
  end

end

