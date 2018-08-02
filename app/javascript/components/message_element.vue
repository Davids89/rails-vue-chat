<template>
    <div class="message-wrapper">
        <span class="user-message">{{ user }}</span> > <span class="text-message">{{ text }}</span>
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
        }
    }
</script>