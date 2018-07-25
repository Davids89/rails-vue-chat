<template>
    <div>
        <h1>Rooms</h1>
    </div>
</template>

<script>
    import axios from 'axios'

    export default {
        data: function() {
            return {
                rooms: []
            }
        },
        methods: {
            loadRooms: function() {
                axios.get('/rooms')
                    .then(function(response){
                        console.log(response);
                    })
                    .catch(function(error){
                        console.log(error);
                    })
            }
        },
        created: function() {
            this.loadRooms();
        }
    }
</script>

<style>

</style>
