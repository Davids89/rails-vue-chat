class Chatroom
  include Mongoid::Document

  field :name, type: String
  field :online_users, type: Integer
  
  has_many :messages

  after_create :new_room_broadcast

  validates_presence_of :name, presence: true
  validates_presence_of :online_users

  private
  def new_room_broadcast
    ActionCable.server.broadcast "room_list", room: self
  end
end
