class BookmarkPolicy < ApplicationPolicy
  def update?
    user.present? && (record.user == user)
  end

  def destroy?
    user.present? && (record.user == user)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
