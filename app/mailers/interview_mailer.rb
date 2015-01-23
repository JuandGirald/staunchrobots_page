class InterviewMailer < ActionMailer::Base
  default :from => "interview@staunchrobots.com", to: "juan.giraldo@staunchrobots.com"

  def new_message(message)
    @message = message
    mail(:subject => "Interview Message from the website")
  end
end