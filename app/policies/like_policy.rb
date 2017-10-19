class LikePolicy < ApplicationPolicy
  def initialize(user, like)
    @user = user
    @like = like
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && (@like.user == user)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
