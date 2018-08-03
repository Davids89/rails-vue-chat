room_type = ['sports', 'news', 'meet_people']

for i in 1..3
    chatroom = Chatroom.create(name: "Sala #{i}", online_users: Random.new.rand(100), room_type: room_type.sample)
    chatroom.save
end