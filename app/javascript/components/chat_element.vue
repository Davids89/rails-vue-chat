<template>
    <div class="chatroom-element">
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
        }
    }
</script>