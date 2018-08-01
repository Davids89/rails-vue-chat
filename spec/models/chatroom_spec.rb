require 'rails_helper'

RSpec.describe Chatroom, type: :model do
    it "is not valid without name" do
        room = create(:chatroom)
        room.name = nil
        expect(room).to_not be_valid
    end
end
