class Chatroom
  include Mongoid::Document
  
  has_many :users
  has_many :messages
end
