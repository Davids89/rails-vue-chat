/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'es6-promise/auto'
import Vue from 'vue/dist/vue.esm';
import router from './routes.js';
import Vuex from 'vuex';
import Store from '../vuex/store.js';
import App from '../app.vue'

import '@fortawesome/fontawesome/styles.css';
import fontawesome from '@fortawesome/fontawesome';
import { faEdit } from '@fortawesome/fontawesome-free-solid';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

fontawesome.config = {
    autoAddCss: false,
  };
  
fontawesome.library.add(faEdit);

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.use(Vuex);

const store = new Vuex.Store(Store);

router.beforeEach(function(to, from, next) {
    if (to.meta && to.meta.protected) {
        if (store.state.isAuthenticated){
            next();
        } else {
            next(to.meta.redirectTo || '/');
        }
    } else {
        next();
    }
})

Vue.config.productionTip = false

document.addEventListener('DOMContentLoaded', () => {

    document.body.appendChild(document.createElement('vue'))

    const app = new Vue({
        router,
        store,
        render: h => h(App)
    }).$mount('vue')
})
