class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_many :likes, dependent: :destroy

  validates :url, presence: true
  validates :url, format: {
    with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i,
    message: "only allow valid urls" }
  validates :topic_id, presence: true
end
