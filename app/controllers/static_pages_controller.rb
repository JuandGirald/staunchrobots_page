class StaticPagesController < ApplicationController
  def home
    @message = session[:message].is_a?(Message) ? session[:message] : Message.new
    @form_error ||= false
  end

  def create
    expected = session['rand1'] + session['rand2']
    @message = Message.new(message_params)
    valid = (expected == params[:captcha].to_i) && @message.valid?
    
    if valid
      NotificationsMailer.new_message(@message).deliver
      session[:track_contact_event] = true
      session[:email] = params[:email]
      redirect_to(root_path, :notice => "Your message was sent successfully.")
    else
      msg = "Check the error list"
      if expected != params[:captcha]
        msg += ' and your math...'
      end
      flash.now.alert = msg
      @form_error = true
      render 'home'
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :body)
    end
end
