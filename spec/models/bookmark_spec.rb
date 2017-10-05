require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:topic) { topic = Topic.create!(title: "Test topic title", user_id: 1) }
  let(:bookmark) { bookmark = topic.bookmarks.create!(url: "http://example.com") }

  it { is_expected.to belong_to(:topic) }

  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:topic_id) }

  describe "attributes" do
    it "has url" do
      expect(bookmark).to have_attributes(url: "http://example.com", topic_id: topic.id)
    end

=begin
    it "checks wrong url format" do
      should validate_format_of(:url).not_with('http://wrongurl').with_message(/only allow valid urls/)
    end
=end
  end
end
