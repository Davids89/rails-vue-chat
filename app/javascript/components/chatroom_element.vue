<template>
    <div class="chatroom-card" v-on:click="openChat" :class="{'sport-type': room_type === 'sports', 'news-type': room_type === 'news', 'meet-people-type': room_type === 'meet_people'}">
        <div class="container">
            <div class="chatroom-data">
                <div class="logo-wrapper">
                    <img class="logo" :src=src>
                </div>
                
                <div class="data">
                    <span class="chatroom-name">{{name}}</span>
                    <span class="chatroom-type">{{ type }}</span>
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
            },
            room_type: {
                type: String,
                required: true
            }
        },
        data: function() {
            return {
                src: chatroomLogo,
                types: [{id: 'sports', value: 'Deportes'},{id: 'news', value: 'Actualidad'},{id: 'meet_people',         value: 'Conocer gente'}],
                type: ""
            }
        },
        methods: {
            openChat: function() {
                this.$router.push('/rooms/' + this._id.$oid)
            }
        },
        mounted: function() {
            this.type = this.types.find(type => type.id === this.room_type).value
        }
    }
</script>