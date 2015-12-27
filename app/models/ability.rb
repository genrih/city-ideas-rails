class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.persisted?
      can :like, :idea
      can [:edit, :update], User, id: user.id
      can :show, :profile
    end
  end
end
