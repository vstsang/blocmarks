class BookmarkPolicy < ApplicationPolicy
  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def update?
    user.present? && (@bookmark.topic.user == user)
  end

  def destroy?
    user.present? && (@bookmark.topic.user == user)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
