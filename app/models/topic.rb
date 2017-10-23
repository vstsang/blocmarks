class Topic < ActiveRecord::Base
  has_many :bookmarks

  validates :title, presence: true
end
