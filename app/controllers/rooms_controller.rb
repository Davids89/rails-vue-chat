class RoomsController < ApplicationController
  def index
    @chatroom = Chatroom.all
    render json: @chatroom
  end

  def create
    @room = Chatroom.new(room_params)

    if @room.save
      render json: @room
    end
  end

  def show
    print "estoy aqui"
    print params
    messages = Message.where("room": params["id"])

    render json: { messages: messages }
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
