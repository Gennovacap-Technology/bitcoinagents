Bitcoinagents::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "users/sessions" }, :path => '/', :path_names => { 
    :sign_in => 'login', 
    :sign_out => 'logout', 
    :password => 'secret', 
    :confirmation => 'verification', 
    :unlock => 'unlock', 
    :registration => 'register', 
    :sign_up => ''
  }

  #devise_scope :user do
    # get "/dashboard/user/verify-token", :to => "devise/devise_authy#GET_verify_authy"
    # get "/dashboard/user/enable-two-factor", :to => "devise/devise_authy#GET_enable_authy"
    # get "/dashboard/user/verify-installation", :to => "devise/devise_authy#GET_verify_authy_installation"
    # post "/dashboard/user/verify-token", :to => "devise/devise_authy#POST_verify_authy"
    # post "/dashboard/user/enable-two-factor", :to => "devise/devise_authy#POST_enable_authy"
    # post "/dashboard/user/verify-installation", :to => "devise/devise_authy#POST_verify_authy_installation"
    # post "/dashboard/user/send-sms", :to => "devise/devise_authy#request_sms"
  #end

  root to: "home#index"

  namespace :dashboard do
    get '/', to: 'dashboard#index', as: ''
    resource :user, only: [:show, :edit, :update]
  end

end