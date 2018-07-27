<template>
    <div class="chat-container">
        <h1>Chat</h1>

        <div class="chat-wrapper">
            <div class="messages-wrapper">
                <div v-for="message in messages" :key="message._id.$oid">
                    <message v-bind="message"></message>
                </div>
            </div>

            <div class="input-wrapper">
                <input type="text" placeholder="..." v-model="message"><button v-on:click="sendMessage">Enviar</button>
            </div>
        </div>
    </div>
</template>

<script>

    import axios from 'axios'
    import Message from '../components/message_element.vue'

    export default {
        data: function () {
            return {
                message: "",
                connection: {},
                id: this.$route.params.id,
                messages: []
            }
        },
        components: {
            Message
        },
        methods: {
            connectWebSocket: function() {
                const that = this
                this.connection = App.cable.subscriptions.create({
                    channel: "RoomChannel",
                    room_id: this.id,
                    user: this.$store.state.username
                }, {
                    connected: () => {
                        console.log("Socket created")
                    },
                    received: (data) => {
                        that.messages.push(data)
                    }
                })
            },
            loadChat: function() {
                const that = this
                axios.get('/rooms/' + this.id)
                    .then(function(response){
                        that.messages = response.data.messages
                    })
                    .catch(function(error){
                        console.log(error)
                    })
            },
            sendMessage: function() {
                this.connection.send({ message: this.message })
            }
        },
        created: function() {
            this.connectWebSocket()
            this.loadChat()
        }
    }
</script>