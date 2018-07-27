class Chatroom
  include Mongoid::Document

  field :name, type: String
  
  has_many :messages

  after_create :new_room_broadcast

  validates_presence_of :name

  private
  def new_room_broadcast
    ActionCable.server.broadcast "room_list", room: self
  end
end
