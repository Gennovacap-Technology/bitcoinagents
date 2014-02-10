require 'sidekiq/web'

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


  # Home Public Area
  get "about"   =>    'home#about',  :as => :about
  get "contact"   =>    'home#contact',  :as => :contact
  get "security"   =>    'home#security',  :as => :security
  
  # User Account Setup and Verification
  get "two_factor_authentication"   =>    'home#two_factor_authentication',   :as =>  :two_factor_authentication
  get "payment_methods"   =>    'home#payment_methods',   :as =>  :payment_methods
  get "deposit_money"   =>    'home#deposit_money',   :as =>  :deposit_money
  get "withdrawal_money"   =>    'home#withdrawal_money',   :as =>  :withdrawal_money
  get "bitcoin_addresses"   =>    'home#bitcoin_addresses',   :as =>  :bitcoin_addresses
  
  # Analysis and Charts: Pre-Purchase
  get "orderbook"   =>    'home#orderbook',  :as => :orderbook
  
  # Buying, Selling, Trading
  get "buyorder_bitcoin_invoice"   =>    'home#buyorder_bitcoin_invoice',   :as =>  :buyorder_bitcoin_invoice
  get "sellorder_bitcoin_invoice"   =>    'home#sellorder_bitcoin_invoice',   :as =>  :sellorder_bitcoin_invoice
 
  # Accounting and transaction history
  get "open_orders"   =>    'home#open_orders',   :as =>  :open_orders
  get "transaction_login_history"   =>    'home#transaction_login_history',   :as =>  :transaction_login_history
  
  mount Sidekiq::Web => '/sidekiq'

end