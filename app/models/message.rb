class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  field :user, type: String
  field :room, type: String

  validates_presence_of :text
  validates_presence_of :user
  validates_presence_of :room

  scope :formatted, -> { order_by(:created_at => 'desc').limit(20) }
end
