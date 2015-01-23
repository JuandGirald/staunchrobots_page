class InterviewMailer < ActionMailer::Base
  default :from => "interview@staunchrobots.com"

  def new_message(message)
    @message = message
    mail(to: "todd.morrill@staunchrobots.com", :subject => "Interview Request")
  end

  def client_message(message)
    @message = message
    mail(to: "#{message.email}", :subject => "Interview Request")
  end
end