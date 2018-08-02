<template>
    <div class="message-wrapper" :class="{'my-message': user == username}">
        <div class="user-wrapper">
            <img :src=src class="user-avatar">
            <span class="user-message">{{ user }}</span>
        </div>
        
        <span class="text-message">{{ text }}</span>
    </div>
</template>

<script>

    import UserLogo from '../../assets/images/user.png'

    export default {
        props: {
            _id: {
                type: Object
            },
            text: {
                type: String
            },
            user: {
                type: String
            }
        },
        data: function() {
            return {
                src: UserLogo,
                username: this.$store.state.username
            }
        }
    }
</script>