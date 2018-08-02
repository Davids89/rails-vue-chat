require 'rails_helper'

RSpec.describe Chatroom, type: :model do
    it "is not valid without name" do
        room = create(:chatroom)
        room.name = nil
        expect(room).to_not be_valid
    end

    it "is not valid without online users" do
        room = create(:chatroom)
        room.online_users = nil
        expect(room).to_not be_valid
    end
end
