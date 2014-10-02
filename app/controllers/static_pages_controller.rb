class StaticPagesController < ApplicationController
  def home
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Your message was sent successfully. ")
    else
      flash.now.alert = "Check the error list"
      render :home
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :body)
    end
end
