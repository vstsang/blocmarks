class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :url, presence: true
  validates :user_id, presence: true
  validates :topic_id, presence: true
end
