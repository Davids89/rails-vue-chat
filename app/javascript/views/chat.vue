<template>
    <div class="chat-container">
        
        <div class="chat-header">
            <img class="logo" :src=src>
            <button v-on:click="goBack">Volver</button>
        </div>

        <div class="chat-wrapper">
            <div class="messages-wrapper">
                <message v-bind="message" v-for="message in messages" :key="message._id.$oid"></message>
            </div>

            <div class="input-wrapper">
                <input type="text" placeholder="..." v-model="message" v-on:keyup="keyinput"><button v-on:click="sendMessage">Enviar</button>
            </div>
        </div>
    </div>
</template>

<script>

    import axios from 'axios'
    import Message from '../components/message_element.vue'
    import logo from '../../assets/images/logo.png'

    export default {
        data: function () {
            return {
                message: "",
                connection: {},
                id: this.$route.params.id,
                messages: [],
                src: logo
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
                        data.index = that.messages.length
                        that.messages.push(data)
                        that.scrollDownChat()
                    }
                })
            },
            scrollDownChat: function() {
                this.$nextTick(() => {
                    const container = this.$el.querySelector('.messages-wrapper')
                    container.scrollTop = container.scrollHeight
                })
            },
            loadChat: function() {
                const that = this
                axios.get('/rooms/' + this.id)
                    .then(function(response){
                        that.messages = response.data.messages

                        for(var i = 0; i < that.messages.length; i++){
                            that.messages[i].index = i
                        }

                        that.scrollDownChat()
                    })
                    .catch(function(error){
                        console.log(error)
                    })
            },
            sendMessage: function() {
                this.connection.send({ message: this.message })
                this.message = ''
            },
            keyinput: function(event) {
                if (event.keyCode == 13) {
                    this.sendMessage()
                }
            },
            goBack: function() {
                this.$router.push('/rooms')
            }
        },
        created: function() {
            this.connectWebSocket()
            this.loadChat()
        }
    }
</script>