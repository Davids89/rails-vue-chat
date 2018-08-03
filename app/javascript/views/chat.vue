<template>
    <div class="chat-container">
        
        <div class="chat-header">
            <img class="logo" :src=src>
            <button v-on:click="goBack"><font-awesome-icon icon="long-arrow-alt-left"/> Volver</button>
        </div>

        <div class="chat-wrapper">

            <div class="messages-wrapper">
                <message v-bind="message" v-for="message in messages" :key="message._id.$oid"></message>
            </div>

            <hr class="separator">

            <div class="input-wrapper">
                <input type="text" placeholder="Escribe algo..." v-model="message" v-on:keyup="keyinput"><button v-on:click="sendMessage">Enviar</button>
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
                src: logo,
                room_type: "",
                room_type_name: "",
                room_name: "",
                types: [{id: 'sports', value: 'Deportes'},{id: 'news', value: 'Actualidad'},{id: 'meet_people',         value: 'Conocer gente'}]
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
                        that.room_name = response.data.name
                        that.room_type = response.data.room_type
                        that.room_type_name = that.types.find(type => type.id === response.data.room_type).value 
                        that.messages = response.data.messages
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