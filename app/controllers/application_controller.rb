class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to main_app.cvs_path, :alert => exception.message
    else
      redirect_to main_app.login_path, :alert => exception.message
    end
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:role, :email, :password, :password_confirmation)}
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  def auth_user
    redirect_to login_path unless user_signed_in?
  end
end
