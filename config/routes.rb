Bitcoinagents::Application.routes.draw do

  root to: "home#index"

  #Home Area
  get "login"   =>    'home#login',  :as => :login
  get "signup"   =>    'home#signup',  :as => :signup
  get "contact"   =>    'home#contact',  :as => :contact
  get "security"   =>    'home#security',  :as => :security
  


  # User Login and Dashboard
  get "dashboard"   =>    'home#dashboard',   :as =>  :dashboard
  get "profile"   =>    'home#profile',   :as =>  :profile
  get "buyorder_bitcoin_invoice"   =>    'home#buyorder_bitcoin_invoice',   :as =>  :buyorder_bitcoin_invoice
  get "sellorder_bitcoin_invoice"   =>    'home#sellorder_bitcoin_invoice',   :as =>  :sellorder_bitcoin_invoice
  get "dashboard2"   =>    'home#dashboard2',   :as =>  :dashboard2
  get "payment_methods"   =>    'home#payment_methods',   :as =>  :payment_methods
  get "transaction_login_history"   =>    'home#transaction_login_history',   :as =>  :transaction_login_history
  get "bitcoincharts"   =>    'home#bitcoincharts',  :as => :bitcoincharts
  get "orderbook"   =>    'home#orderbook',  :as => :orderbook
  get "sellbitcoin"   =>    'home#sellbitcoin',  :as => :sellbitcoin
  get "buybitcoin"   =>    'home#buybitcoin',  :as => :buybitcoin
  
  



end
