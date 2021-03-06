import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

import HomeIndex from '../views/index.vue';
import Rooms from '../views/rooms.vue';
import Chat from '../views/chat.vue';
import Redirector from '../redirector.vue'

const router = new VueRouter({
    routes: [
        { path: '/', component: Redirector },
        { path: '/login', component: HomeIndex},
        { path: '/rooms', component: Rooms, name: 'rooms_path',
            meta: {
                protected: true,
                redirectTo: '/'
            }},
        { path: '/rooms/:id', component: Chat, name: 'chat_path',
            meta: {
                protected: true,
                redirectTo: '/'
            }}
    ]
});

export default router;