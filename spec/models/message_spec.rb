require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is not valid without text" do
    msg = create(:message)
    msg.text = nil
    expect(msg).to_not be_valid
  end
end
