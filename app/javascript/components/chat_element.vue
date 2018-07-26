<template>
    <div class="chatroom-element" v-on:click="openChat">
        {{name}}
    </div>
</template>

<script>
    export default {
        props: {
            _id: {
                type: Object,
                required: true
            },
            name: {
                type: String,
                required: true
            }
        },
        methods: {
            openChat: function() {
                this.$router.push('/rooms/' + this._id.$oid)
            }
        }
    }
</script>