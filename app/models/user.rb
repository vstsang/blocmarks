class User < ActiveRecord::Base
  extend FriendlyId

  has_many :bookmark
  has_many :likes, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  friendly_id :email, use: :slugged

  enum role: [:standard, :premium, :admin]

  def init
    self.role ||= :standard
  end

  # Returns the bookmark if liked or nil
  def liked(bookmark)
   likes.where(bookmark_id: bookmark.id).first
  end
end
