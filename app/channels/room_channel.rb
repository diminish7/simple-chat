# frozen_string_literal: true

class RoomChannel < ApplicationCable::Channel
  def subscribed
    return reject if room.blank?

    stream_from channel_name
  end

  def receive(data)
    message = Message.new(room: room, from: data['from'], content: data['content'])

    if message.save
      ActionCable.server.broadcast(channel_name, data)
    else
      from = data['from'].presence || I18n.t('unknown')
      content = I18n.t('could_not_post', error: message.errors.full_message.join(', '))

      ActionCable.server.broadcast(channel_name, { from: from, content: content })
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def room
    @room ||= Room.find_by(id: params[:room_id]) if params[:room_id].present?
  end

  def channel_name
    "room#{room.id}_channel"
  end
end
