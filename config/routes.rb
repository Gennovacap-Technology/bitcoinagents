Bitcoinagents::Application.routes.draw do

  root to: "home#index"

  #Home Area
  get "login"   =>    'home#login',  :as => :login
  get "signup"   =>    'home#signup',  :as => :signup
  get "contact"   =>    'home#contact',  :as => :contact
  get "security"   =>    'home#security',  :as => :security
  


  # User Login and Dashboard
  get "dashboard"   =>    'home#dashboard',   :as =>  :dashboard
  get "transaction_login_history"   =>    'home#transaction_login_history',   :as =>  :transaction_login_history
  get "bitcoincharts"   =>    'home#bitcoincharts',  :as => :bitcoincharts
  get "orderbook"   =>    'home#orderbook',  :as => :orderbook
  get "sellbitcoin"   =>    'home#sellbitcoin',  :as => :sellbitcoin
  get "buybitcoin"   =>    'home#buybitcoin',  :as => :buybitcoin
  
  



end
