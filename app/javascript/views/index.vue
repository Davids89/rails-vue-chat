<template>
    <div class="login-wrapper">
        <img class="logo" :src=src />
        <div class="input-wrapper">
            <input v-model="username" type="text" placeholder="Usuario" id="username" name="username">
            <button v-on:click="login">Entrar</button>
        </div>
        <p class="login-error" v-if="showError">{{ error }}</p>
    </div>
</template>

<script>

import logo from '../../assets/images/logo.png'

export default {

    data: function() {
        return {
            showError: false,
            error: '',
            username: '',
            src: logo
        }
    },
    methods: {
        login: function () {
            if (this.username.length > 2) {
                console.log(this.$store)
                this.$store.commit('login', this.username);
                this.$router.push('/rooms');
            } else {
                this.error = "El nombre debe ser mayor de 2 caracteres"
                this.showError = true
            }
        }
    },
    watch: {
        username: function(newUsername, oldUsername) {
            this.showError = false
            if (newUsername.length > 2) {
                this.disableButton = false
            }
        }
    }
}

</script>