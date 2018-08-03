require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    subject do
      post :create, params: {
        room: { name: "test", room_type: "news"}
      }
    end

    it "creates the room" do
      expect{subject}.to change {Chatroom.count}.by 1
    end

    it "returns http success" do
      expect(subject).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let!(:chatroom) { create :chatroom }

    it "returns http success" do
      get :show, params: { id: chatroom.id }
      expect(response).to have_http_status(:success)
    end
  end

end
