class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks

  validates :title, presence: true
  validates :user_id, presence: true
end
