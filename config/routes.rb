Bitcoinagents::Application.routes.draw do

  root to: "home#index"

  #Home Area
  get "login"   =>    'home#login',  :as => :login
  get "signup"   =>    'home#signup',  :as => :signup
  get "login"   =>    'home#login',  :as => :login
  get "bitcoincharts"   =>    'home#bitcoincharts',  :as => :bitcoincharts
  get "contact"   =>    'home#contact',  :as => :contact
  get "security"   =>    'home#security',  :as => :security
  get "sellbitcoin"   =>    'home#sellbitcoin',  :as => :sellbitcoin


  #Bitcoin Agent User Login and Dashboard
  get "bituser/bituser_dashboard"
  get "bituser/bituser_historictrades"
  get "bituser/bituser_profile"
  get "bituser/bituser_invoice"
  



end
