# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Property do |property|
        property.user == user
    end

    can :edit, Property do |property|
        property.user == user
    end

    can :update, Property do |property|
        property.user == user
    end

    can :destroy, Property do |property|
        property.user == user
    end

    can :read, Request do |request|
        request.user == user
    end

    can :edit, Request do |request|
        request.user == user
    end

    can :update, Request do |request|
        request.user == user
    end

    can :destroy, Request do |request|
        request.user == user
    end

    can :read, Landlord do |landlord|
        landlord.user == user
    end

    can :edit, Landlord do |landlord|
        landlord.user == user
    end

    can :update, Landlord do |landlord|
        landlord.user == user
    end

    can :destroy, Landlord do |landlord|
        landlord.user == user
    end

    can :read, Tenant do |tenant|
        tenant.user == user
    end

    can :edit, Tenant do |tenant|
        tenant.user == user
    end

    can :update, Tenant do |tenant|
        tenant.user == user
    end

    can :destroy, Tenant do |tenant|
        tenant.user == user
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
