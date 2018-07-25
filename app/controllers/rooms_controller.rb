class RoomsController < ApplicationController
  def index
    @chatroom = Chatroom.all
    render json: @chatroom
  end
end
