require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is not valid without text" do
    msg = create(:message)
    msg.text = nil
    expect(msg).to_not be_valid
  end

  it "is not valid without user" do
    msg = create(:message)
    msg.user = nil
    expect(msg).to_not be_valid
  end

  it "is not valid without room" do
    msg = create(:message)
    msg.room = nil
    expect(msg).to_not be_valid
  end
end
