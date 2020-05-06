# frozen_string_literal: true

RSpec.describe Room, type: :model do
  subject(:room) { build(:room) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
