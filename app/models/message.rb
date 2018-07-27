class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  field :user, type: String
  field :room, type: String

  validates_presence_of :text

  scope :formatted, -> { order_by(:created_at => 'asc').limit(20) }
end
