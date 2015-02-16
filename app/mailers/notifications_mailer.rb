class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@staunchrobots.com", to: "todd.morrill@staunchrobots.com", cc: 'derek.scruggs@staunchrobots.com'

  def new_message(message)
    @message = message
    mail(:subject => "[Lead] Message from web site")
  end

  def new_user_waiting_for_approval(message)
    @message = message
    mail(to: "todd.morrill@staunchrobots.com", :subject => "User waiting for approval")
  end

  def user_approved(message)
    @message = message
    mail(to: "#{message.email}", :subject => "User approved")
  end
end