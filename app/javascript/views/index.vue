<template>
    <div class="login-wrapper">
        <div class="input-wrapper">
            <input v-model="username" type="text" placeholder="Usuario" id="username">
            <button v-on:click="login">Entrar</button>
        </div>
    </div>
</template>

<script>

export default {
    data: function() {
        return {
            username: ''
        }
    },
    methods: {
        login: function () {
            if (this.username.length > 2) {
                this.$store.commit('login', this.username);
                this.$router.push('/rooms');
            }
        }
    }
}

</script>