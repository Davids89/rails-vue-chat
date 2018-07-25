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

    export default {
        data: function() {
            return {
                rooms: []
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
                        console.log(that.rooms)
                    })
                    .catch(function(error){
                        console.log(error);
                    })
            }
        },
        created: function() {
            this.loadRooms();
        }
    }
</script>

<style>

</style>
