Bitcoinagents::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "users/sessions", :devise_authy => "users/devise_authy" }, :path => '/', :path_names => { 
    :sign_in => 'login', 
    :sign_out => 'logout', 
    :password => 'secret', 
    :confirmation => 'verification', 
    :unlock => 'unlock', 
    :registration => 'register', 
    :sign_up => '',
    :verify_authy => "verify-token",
    :enable_authy => "enable-two-factor",
    :verify_authy_installation => "verify-installation"
  }

  root to: "home#index"

  namespace :dashboard do
    get '/', to: 'dashboard#index', as: ''
    resource :user, only: [:show, :edit, :update]

    match "/bitcoin", :to => "bitcoin#show", :as => "bitcoin"
    match "/bitcoin/buybitcoin", :to => "bitcoin#buybitcoin", :as => "bitcoin_buy"
    match "/bitcoin/sellbitcoin", :to => "bitcoin#sellbitcoin", :as => "bitcoin_sell"
  end

end