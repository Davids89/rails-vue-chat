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

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
