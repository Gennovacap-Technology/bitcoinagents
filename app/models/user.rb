class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %[admin user guest]
  
  before_create :user_role
  before_create :create_wallet

  devise :authy_authenticatable, :async, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :username, :email, :address, :city, :state, :phone, :country_id, :currency_id, :account

  def role?(base_role)
  	ROLES.index(role) == ROLES.index(base_role.to_s)
  end

  def have_address?
    self.address.present? || self.city.present? || self.state.present?
  end

  protected

  def user_role
  	self.role = 'user' if self.role == nil
  end

  def create_wallet
    
  end

end
