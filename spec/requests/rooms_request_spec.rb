# frozen_string_literal: true

RSpec.describe 'Rooms', type: :request do
  describe '#index' do
    subject { response }

    before { get '/' }

    it { is_expected.to be_successful }
  end

  describe '#show' do
    subject { response }

    let(:room) { create(:room) }

    before { get "/rooms/#{room.id}" }

    it { is_expected.to be_successful }
  end

  describe '#new' do
    subject { response }

    before { get '/rooms/new' }

    it { is_expected.to be_successful }
  end

  describe '#create' do
    subject { response }

    let(:room_name) { 'The New Room' }

    before { post '/rooms', params: { room: { name: room_name } } }

    it { is_expected.to redirect_to(Room.first) }

    it 'creates the room' do
      expect(Room.find_by(name: room_name)).to be_present
    end
  end

  describe '#edit' do
    subject { response }

    let(:room) { create(:room) }

    before { get "/rooms/#{room.id}/edit" }

    it { is_expected.to be_successful }
  end

  describe '#update' do
    subject { response }

    let(:room) { create(:room) }
    let(:new_name) { 'New Name for My Room' }

    before { put "/rooms/#{room.id}", params: { room: { name: new_name } } }

    it { is_expected.to redirect_to(room) }

    it 'changes the room name' do
      expect(room.reload.name).to eq(new_name)
    end
  end

  describe '#destroy' do
    subject { response }

    let(:room) { create(:room) }

    before { delete "/rooms/#{room.id}" }

    it { is_expected.to redirect_to(root_path) }

    it 'destroys the room' do
      expect(Room.find_by(id: room.id)).to be_blank
    end
  end
end
