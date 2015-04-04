class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, Schedule
      can :update, Schedule do |comment|
        comment.try(:user) == user || user.role?(:moderator)
      end
    end
  end
end