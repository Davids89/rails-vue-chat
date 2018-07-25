import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

import HomeIndex from '../views/index.vue';
import Rooms from '../views/rooms.vue';

const router = new VueRouter({
    routes: [
        { path: '/', component: HomeIndex, name: 'root_path' },
        { path: '/rooms', component: Rooms, name: 'rooms_path',
            meta: {
                protected: true,
                redirectTo: '/'
            }}
    ]
});

export default router;