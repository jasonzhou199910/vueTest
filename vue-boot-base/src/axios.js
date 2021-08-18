//前置拦截和后置拦截
import axios from 'axios'
import ElementUI from 'element-ui';
import store from './store'
import router from './router'

axios.default.baseURI = "http://localhost:8085";
axios.defaults.withCredentials = true;// 允许跨域携带cookie
//前置拦截
axios.interceptors.request.use(config => {

  return config
});

//后置拦截
axios.interceptors.response.use(response => {
    let res = response.data;
    if (res.code == 0 || res.code==null) {
      return response;
    } else {
      ElementUI.Message.error(response.data.msg, {duration: 3 * 1000});
      return Promise.reject(response.data.msg)
    }
  },error => {
    if (error.response.data) {
      error.message = error.response.data.msg;
    }

    if (error.response.status === 401) {
      store.commit("REMOVE_INFO")
      router.push("/login")
    }
    ElementUI.Message.error(error.message, {duration: 3 * 1000});
    return Promise.reject(error);
  }
);
