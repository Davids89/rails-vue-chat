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
                        <input name="room_name" class="form-control" v-model="chatroom_name" placeholder="Nombre de la sala">
                    </label>
                    <label class="form-label">
                        <vue-select v-model="type_selected" :options=types></vue-select>
                    </label>
                </div>
                <div class="modal-footer text-right">
                    <button class="modal-default-button cancel-button" @click="close">
                        Cancelar
                    </button>

                    <button class="modal-default-button save-button" @click="save">
                        Guardar
                    </button>
                </div>
            </div>
        </div>
    </transition>
</template>


<script>

    import VueSelect from 'vue-select'

    export default {
        data: function () {
            return {
                chatroom_name: "",
                types: [{label: 'Deportes', value: 'sports'},{label: 'Actualidad', value: 'news'},{label: 'Conocer gente', value: 'meet_people'}],
                type_selected: ""
            }
        },
        components: {
            VueSelect
        },
        methods: {
            close: function () {
                this.chatroom_name = ""
                this.$emit('dismiss')
            },
            save: function() {
                if (this.chatroom_name.length > 0) {
                    const params = {'name': this.chatroom_name, 'room_type': this.type_selected.value}
                    this.$emit('save', params)
                    this.close()
                }
            }
        }
    }
</script>
