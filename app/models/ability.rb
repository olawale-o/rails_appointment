class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Doctor, User: user
    can :manage, Appointment, User: user
    # can :manage, :all if user.admin?
  end
end
