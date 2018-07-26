<template>
    <div class="chat-container">
        <h1>Chat</h1>

        <div class="chat-wrapper">
            <div class="messages-wrapper">

            </div>

            <div class="input-wrapper">
                <input type="text" placeholder="..." v-model="message"><button v-on:click="sendMessage">Enviar</button>
            </div>
        </div>
    </div>
</template>

<script>

    import axios from 'axios'

    export default {
        data: function () {
            return {
                message: "",
                connection: {},
                id: this.$route.params.id
            }
        },
        methods: {
            connectWebSocket: function() {
                this.connection = App.cable.subscriptions.create({
                    channel: "RoomChannel",
                    room_id: this.id,
                    user: /* this.$store.state.username */ "aaa"
                }, {
                    connected: () => {
                        console.log("Socket created")
                    },
                    received: (data) => {
                        console.log(data)
                    }
                })
            },
            loadChat: function() {
                axios.get('/rooms/' + this.id)
                    .then(function(response){
                        console.log(response)
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