# frozen_string_literal: true

class RoomChannel < ApplicationCable::Channel
  def subscribed
    return reject if room.blank?

    stream_from "room#{room.id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def room
    @room ||= Room.find_by(id: params[:room_id]) if params[:room_id].present?
  end
end
