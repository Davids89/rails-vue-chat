<template>
    <div class="message-wrapper" :class="{'my-message': user === username}">
        <div class="user-wrapper">
            <font-awesome-icon icon="smile" /> <span class="user-message">{{ user }}</span>
        </div>
        
        <span class="text-message" :class="{'my-text-message': user === username}">{{ text }}</span>
    </div>
</template>

<script>
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
                username: this.$store.state.username
            }
        }
    }
</script>