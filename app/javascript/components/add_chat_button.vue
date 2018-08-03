<template>
    <div class="add-chat-button-wrapper">
        <button v-on:click="showModal" class="new-room-button">
            <font-awesome-icon icon="plus-circle"></font-awesome-icon>
            Nueva sala
        </button>
        <chat-room-modal v-if="modalVisible" @dismiss="hideModal" @save="createRoom"></chat-room-modal>
    </div>
</template>

<script>
    import ChatRoomModal from './chatroom_modal.vue'
    import axios from 'axios'

    export default {
        data: function () {
            return {
                 modalVisible: false,
            }
        },
        components: {
            ChatRoomModal
        },
        methods: {
            showModal: function() {
                this.modalVisible = true
            },
            hideModal: function() {
                this.modalVisible = false
            },
            createRoom: function(params) {
                axios.post('/rooms', {
                    room: params
                })
            }
        },
        mounted: function() {
            document.addEventListener("keydown", (e) => {
                if (this.modalVisible && e.keyCode == 27) {
                    this.modalVisible = false
                }
            })
        }
    }
</script>