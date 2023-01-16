class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_#{params[:room_id]}_channel"
    # stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def get_user_data
    user = {
      id: current_user.id,
      email: current_user.email,
      username: current_user.email.split('@')[0]
    }
    puts params[:room_id]
    ActionCable.server.broadcast "room_#{params[:room_id]}_channel", { user: }
  end
end
