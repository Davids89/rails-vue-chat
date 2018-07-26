class Message
  include Mongoid::Document
  field :text, type: String
  field :user, type: String
  field :room, type: String

  validates_presence_of :text
end
