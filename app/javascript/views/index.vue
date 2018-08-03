<template>
    <div class="login-wrapper">
        <img class="logo" :src=src />
        <div class="input-wrapper">
            <div class="group">      
                <input v-model="username" type="text" id="username" name="username" v-on:keyup="keyinput">
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Usuario</label>
            </div>
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
                this.$store.commit('login', this.username);
                this.$router.push('/rooms');
            } else {
                this.error = "El nombre debe ser mayor de 2 caracteres"
                this.showError = true
            }
        },
        keyinput: function(event) {
            if (event.keyCode == 13) {
                this.login()
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