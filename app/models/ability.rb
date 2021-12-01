class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Doctor
    can :manage, Doctor, user: user
    can :manage, Appointment, user: user
    # can :manage, :all if user.admin?
  end
end
