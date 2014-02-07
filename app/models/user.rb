class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %[admin user guest]
  before_create :user_role
  devise :authy_authenticatable, :async, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def role?(base_role)
  	ROLES.index(role) == ROLES.index(base_role.to_s)
  end

  protected

  def user_role
  	self.role = 'user' if self.role == nil
  end

end
