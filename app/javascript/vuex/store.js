    export default {
        state: {
            isAuthenticated: false,
            username: ''
        },
        mutations: {
            login (state, newUsername) {
                state.isAuthenticated = true;
                state.username = newUsername;
            },
            logout (state) {
                state.isAuthenticated = false;
                state.username = '';
            }
        }
    }