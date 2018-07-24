class Message
  include Mongoid::Document
  field :text, type: String

  belongs_to :user
  validates_presence_of :text
end
