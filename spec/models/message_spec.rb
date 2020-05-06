# frozen_string_literal: true

RSpec.describe Message, type: :model do
  subject(:message) { build(:message) }

  it { is_expected.to belong_to(:room) }
  it { is_expected.to validate_presence_of(:from) }
  it { is_expected.to validate_presence_of(:content) }
end
