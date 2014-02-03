Bitcoinagents::Application.routes.draw do

  root to: "home#index"

  # Home Public Area
  get "login"   =>    'home#login',  :as => :login
  get "about"   =>    'home#about',  :as => :about
  get "signup"   =>    'home#signup',  :as => :signup
  get "contact"   =>    'home#contact',  :as => :contact
  get "security"   =>    'home#security',  :as => :security
  
  # User Account Setup and Verification
  get "dashboard"   =>    'home#dashboard',   :as =>  :dashboard
  get "profile"   =>    'home#profile',   :as =>  :profile
  get "two_factor_authentication"   =>    'home#two_factor_authentication',   :as =>  :two_factor_authentication
  get "payment_methods"   =>    'home#payment_methods',   :as =>  :payment_methods
  get "deposit_money"   =>    'home#deposit_money',   :as =>  :deposit_money
  get "withdrawal_money"   =>    'home#withdrawal_money',   :as =>  :withdrawal_money
  get "bitcoin_addresses"   =>    'home#bitcoin_addresses',   :as =>  :bitcoin_addresses
  
  # Analysis and Charts: Pre-Purchase
  get "orderbook"   =>    'home#orderbook',  :as => :orderbook
  get "bitcoincharts"   =>    'home#bitcoincharts',  :as => :bitcoincharts
  
  # Buying, Selling, Trading
  get "buybitcoin"   =>    'home#buybitcoin',  :as => :buybitcoin
  get "buyorder_bitcoin_invoice"   =>    'home#buyorder_bitcoin_invoice',   :as =>  :buyorder_bitcoin_invoice
  get "sellbitcoin"   =>    'home#sellbitcoin',  :as => :sellbitcoin
  get "sellorder_bitcoin_invoice"   =>    'home#sellorder_bitcoin_invoice',   :as =>  :sellorder_bitcoin_invoice
 
  # Accounting and transaction history
  get "open_orders"   =>    'home#open_orders',   :as =>  :open_orders
  get "transaction_login_history"   =>    'home#transaction_login_history',   :as =>  :transaction_login_history
 



end
