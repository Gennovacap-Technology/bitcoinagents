class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.role? :admin
      can :manage, :all
    end
    
    if user.role? :user
      can [:show, :update], User
      can :read, Dashboard
    end

    if user.role? :guest
      can :manage, :all
    end
  end

end