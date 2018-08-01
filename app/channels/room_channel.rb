class RoomChannel < ActionCable::Channel::Base
    def subscribed
        stream_from room_channel
    end

    def receive(data)
        message = Message.new(text: data["message"], user: params[:user], room: params[:room_id])

        if message.save
            ActionCable.server.broadcast room_channel, msg_response(message)
        end
    end
    
    private
    def room_channel
        "room_#{params[:room_id]}"
    end

    def msg_response(data)
        {
            _id: data.id,
            text: data.text,
            user: data.user,
            room: data.room
        }
    end
end