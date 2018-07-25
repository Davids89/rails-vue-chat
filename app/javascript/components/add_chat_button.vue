<template>
    <div>
        <button v-on:click="showModal">
            Nueva sala
        </button>
        <chat-room-modal v-if="modalVisible" @dismiss="hideModal"></chat-room-modal>
    </div>
</template>

<script>
    import ChatRoomModal from './chatroom_modal.vue'

    export default {
        data: function () {
            return {
                 modalVisible: false
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
            }
        }
    }
</script>