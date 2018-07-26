<template>
    <!-- template for the modal component -->
    <transition name="modal">
        <div class="modal-mask" @click="$emit('dismiss')">
            <div class="modal-container" @click.stop>
                <div class="modal-header">
                    <h3>Crear nueva sala</h3>
                </div>
                <div class="modal-body">
                    <label class="form-label">
                        Nombre de la sala
                        <input class="form-control" v-model="chatroom_name">
                    </label>
                </div>
                <div class="modal-footer text-right">
                    <button class="modal-default-button" @click="close">
                        Cancelar
                    </button>

                    <button class="modal-default-button" @click="save">
                        Guardar
                    </button>
                </div>
            </div>
        </div>
    </transition>
</template>


<script>
    export default {
        data: function () {
            return {
                chatroom_name: ""
            }
        },
        methods: {
            close: function () {
                this.chatroom_name = ""
                this.$emit('dismiss')
            },
            save: function() {
                this.$emit('save', this.chatroom_name)
                this.close()
            }
        }
    }
</script>
