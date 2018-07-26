for i in 1..3
    chatroom = Chatroom.create(name: "Sala #{i}")
    chatroom.save
end