require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(title: "Test topic title", user_id: 1) }

  it { is_expected.to have_many(:bookmarks) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }

  describe "attributes" do
    it "has title" do
      expect(topic).to have_attributes(title: "Test topic title", user_id: 1)
    end
  end
end
