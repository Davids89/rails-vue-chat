<template>
    <div>
        <p>{{ user }} > {{ text }}</p>
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