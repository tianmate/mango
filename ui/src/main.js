//核心组件APP.vue
import Vue from 'vue'
import App from './App.vue'
//vuex
import store from './store/store';
//重置样式
import './assets/css/reset.css'
import './assets/css/base.css'
import './assets/css/common.css'
//路由
import router from './router'
//axios
import axios from 'axios'
Vue.prototype.$http = axios;

// ElementUI
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

//cookie
import Cookies from 'js-cookie';
window.Cookies = Cookies;


//自定义封装接口
import apis from "./network/api";
window.capis = apis;



Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
