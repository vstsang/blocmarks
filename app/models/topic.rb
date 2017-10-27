class Topic < ActiveRecord::Base
  extend FriendlyId

  has_many :bookmarks

  friendly_id :title, use: :slugged

  validates :title, presence: true
end
