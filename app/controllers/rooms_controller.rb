class RoomsController < ApplicationController
  def index
    @chatroom = Chatroom.all
    render json: @chatroom
  end


  def create
    @room = Chatroom.new(room_params)
    @room.online_users = Random.new.rand(100)

    if @room.save
      render json: @room
    end
  end

  def show
    room = Chatroom.find(params["id"])
    messages = Message.where("room": params["id"]).formatted

    render json: { messages: messages.reverse, room_type: room.room_type, name: room.name }
  end

  private
  def room_params
    params.require(:room).permit(:name, :room_type)
  end
end
