<template>
    <div class="modal-mask" @click="$emit('dismiss')">
        <div class="modal-wrapper">
            <div class="modal-container" @click.stop>

                <div class="modal-header">
                    <slot name="header">
                    default header
                    </slot>
                </div>

                <div class="modal-body">
                    <slot name="body">
                    default body
                    </slot>
                </div>

                <div class="modal-footer">
                    <slot name="footer">
                    default footer
                    <button class="modal-default-button" @click="$emit('close')">
                        OK
                    </button>
                    <button class="modal-default-button" @click="$emit('dismiss')">
                        Cancelar
                    </button>
                    </slot>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        
    }
</script>
