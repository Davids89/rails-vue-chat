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
    messages = Message.where("room": params["id"]).formatted

    render json: { messages: messages.reverse }
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
