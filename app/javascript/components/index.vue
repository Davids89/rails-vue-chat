<template>
    <div class="login-wrapper">
        <div class="input-wrapper">
            <input type="text" placeholder="Usuario" id="username">
            <button v-on:click="login">Entrar</button>
        </div>
    </div>
</template>

<script>

export default {
    methods:    {
        login: function () {
            this.$router.push('/rooms')
        }
    }
}

</script>

<style lang="sass" scoped>

.login-wrapper
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;

    .input-wrapper
        height: 30px;
        width: 30%;

        input
            width: 80%;
            border-style: solid;
            padding: 0 10px 0 10px;

        input, button
            height: inherit;

</style>