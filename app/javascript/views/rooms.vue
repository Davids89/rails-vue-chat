<template>
    <div>
        <h1>Rooms</h1>

        <new-room-button></new-room-button>

        <div v-for="room in rooms" :key="room.id" class="chatroom-list">
            <chat-item v-bind="room"></chat-item>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    import ChatItem from '../components/chat_element.vue'
    import NewRoomButton from '../components/add_chat_button.vue'

    let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
    axios.defaults.headers.common['X-CSRF-Token'] = token
    axios.defaults.headers.common['Accept'] = 'application/json'

    export default {
        data: function() {
            return {
                rooms: [],
                connection: {}
            }
        },
        components: {
            ChatItem,
            NewRoomButton
        },
        methods: {
            loadRooms: function() {
                const that = this;
                axios.get('/rooms')
                    .then(function(response){
                        that.rooms = response.data
                    })
                    .catch(function(error){
                        console.log(error);
                    })
            },
            connectWebSocket: function() {
                this.connection = App.cable.subscriptions.create({
                    channel: "RoomListChannel"
                }, {
                    connected: () => {
                        console.log("Socket created")
                    },
                    received: (data) => {
                        this.rooms.unshift(data.room)
                    }
                })
            }
        },
        created: function() {
            this.loadRooms();
            this.connectWebSocket()
        }
    }
</script>

<style>

</style>
