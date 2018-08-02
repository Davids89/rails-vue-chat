for i in 1..3
    chatroom = Chatroom.create(name: "Sala #{i}", online_users: Random.new.rand(100))
    chatroom.save
end