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
        app_view = ['home']
        dashboard_view = ['dashboard/dashboard', 'dashboard/bitcoin', 'dashboard/users']
        others_view = ['devise/registrations', 'devise/confirmations', 'devise/passwords', 'users/devise_authy', 'users/sessions']

        if app_view.include? params[:controller]
            "application"
        elsif dashboard_view.include? params[:controller]
            "dashboard"
        elsif others_view.include? params[:controller]
            "auth"
        end
    end

    def bitcoin
        @bitcoin ||= Bitcoin.new("http://gennovacap:testserver@127.0.0.1:18332")
    end
    helper_method :bitcoin

    def qr_code(size, url)
        "https://chart.googleapis.com/chart?cht=qr&chs=#{size}x#{size}&chl=#{CGI.escape(url)}"
    end
    helper_method :qr_code

end