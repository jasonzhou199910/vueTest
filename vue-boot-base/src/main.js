import 'babel-polyfill';
import Vue from 'vue'
import Vuex from 'vuex'
import App from './App'
import axios from 'axios'
import router from './router'
import 'element-ui/lib/theme-chalk/index.css';
import mavonEditor from "mavon-editor"
import VueI18n from 'vue-i18n';
import { messages } from './components/common/i18n';
import 'mavon-editor/dist/css/index.css'
import './assets/css/icon.css';
import './components/common/directives';
import './assets/css/theme-green/index.css'
import VueAxios from 'vue-axios'
import store from './store'
import "./permission"
import ElementUI from 'element-ui';
import "./axios"
import  VueQuillEditor from 'vue-quill-editor'
 // require styles 引入样式
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import dayjs from 'dayjs'
Vue.config.productionTip = false;
Vue.config.debug=true;
Vue.use(VueQuillEditor);
Vue.use(VueI18n);
Vue.use(mavonEditor);
Vue.use(Vuex);
Vue.use(VueAxios,axios);
Vue.use(router);
Vue.use(ElementUI);
Vue.prototype.$axios =axios;
Vue.prototype.$base_url='http://localhost:8085/';
Vue.prototype.dayjs = dayjs;

const i18n = new VueI18n({
  locale: 'zh',
  messages
});
new Vue({
  el: '#app',
  router,
  store,
  i18n,
  render: h => h(App)
});

//axios 前置拦截和后置拦截
