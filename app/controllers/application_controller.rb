class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # after_filter :store_location
  before_filter :update_sanitized_params, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to main_app.cvs_path, :alert => exception.message
    else
      redirect_to main_app.login_path, :alert => exception.message
    end
  end

  # cancan fix with rails 4
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:role, :email, :password, :password_confirmation, :name,
                                                          :phone, :skype, :comments, :company, :monthly_digest)}
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

  # def auth_user
  #   redirect_to login_path unless user_signed_in?
  # end

  # def store_location
  #   # store last url - this is needed for post-login redirect to whatever the user last visited.
  #   return unless request.get? 
  #   if (request.path != "/users/sign_in" &&
  #       request.path != "/login" &&
  #       request.path != "/users/sign_up" &&
  #       request.path != "/users/password/new" &&
  #       request.path != "/users/password/edit" &&
  #       request.path != "/users/confirmation" &&
  #       request.path != "/users/sign_out" &&
  #       !request.xhr?) # don't store ajax calls
  #     session[:previous_url] = request.fullpath 
  #   end
  # end

  def after_sign_in_path_for(resource)
    cvs_path
  end
end
