import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
    //数据
    state: {
        userInfo:{
            id:null,
            name:null
        }
    },
    mutations: {
        // 参数列表state指的是state数据

    },
    actions: {
    },
    modules: {
        // state指的是state的数据
        // name传递过来的数据

    }
})