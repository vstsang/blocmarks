require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(title: "Test topic title") }

  it { is_expected.to have_many(:bookmarks) }

  it { is_expected.to validate_presence_of(:title) }

  describe "attributes" do
    it "has title" do
      expect(topic).to have_attributes(title: "Test topic title")
    end
  end
end
