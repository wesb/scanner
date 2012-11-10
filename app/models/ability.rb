class Ability
  include CanCan::Ability

  def initialize(user)
    can :products, Customer
    return if user.nil?
    if user
      can :manage, :all
    end
  end
end