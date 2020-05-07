# frozen_string_literal: true

RSpec.describe RoomChannel, type: :channel do
  # TODO: This is failing
  context 'with no room' do
    it 'rejects the connection' do
      subscribe
      expect(subscription).to be_rejected
    end
  end

  context 'with a room' do
    let(:room) { create(:room) }

    it 'subscribes to a stream when room id is provided', :aggregate_failures do
      subscribe(room_id: room.id)

      expect(subscription).to be_confirmed
      expect(subscription.streams).to include("room#{room.id}_channel")
    end
  end
end
