class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :users_layout
  check_authorization :unless => :devise_controller?

  # Overwrite the redirect after login
  def after_sign_in_path_for(resource)
  	dashboard_path
  end

  # Permission redirect
  rescue_from CanCan::AccessDenied do |exception|
  	if user_signed_in?
  		redirect_to dashboard_path, :alert => exception.message
  	else
    	redirect_to root_url
    end
  end

  private

  # Change the app layout based on the user session
  def users_layout
  	user_signed_in? ? "dashboard" : "application"
  end

  def bitcoin
  	@bitcoin ||= Bitcoin.new("http://gennovacap:testserver@127.0.0.1:18332")
  end
  helper_method :bitcoin

end
