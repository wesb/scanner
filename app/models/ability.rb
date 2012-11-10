class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?
    if user
      can :manage, :all
    end
  end
end