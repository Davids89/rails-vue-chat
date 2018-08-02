<template>
    <div class="chatroom-card" v-on:click="openChat">
        <div class="container">
            <div class="chatroom-data">
                <div class="logo-wrapper">
                    <img class="logo" :src=src>
                </div>
                
                <div class="data">
                    <span class="chatroom-name">{{name}}</span>
                    <span class="online-users">Usuarios online: {{online_users}} </span>
                </div>
            </div>
            <div class="chatroom-extra">
                <span class="date"></span>
            </div>
        </div>
        
    </div>
</template>

<script>
    import chatroomLogo from '../../assets/images/chatroom.png'

    export default {
        props: {
            _id: {
                type: Object,
                required: true
            },
            name: {
                type: String,
                required: true
            },
            online_users: {
                type: Number,
                required: true
            }
        },
        data: function() {
            return {
                src: chatroomLogo
            }
        },
        methods: {
            openChat: function() {
                this.$router.push('/rooms/' + this._id.$oid)
            }
        }
    }
</script>