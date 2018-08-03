class Chatroom
  include Mongoid::Document

  field :name, type: String
  field :online_users, type: Integer
  field :room_type, type: String
  
  has_many :messages

  after_create :new_room_broadcast

  validates_presence_of :name
  validates_presence_of :online_users
  validates_presence_of :room_type

  private
  def new_room_broadcast
    ActionCable.server.broadcast "room_list", room: self
  end
end
