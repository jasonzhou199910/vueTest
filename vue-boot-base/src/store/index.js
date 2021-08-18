import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex);
export default new Vuex.Store({
  state: {
    token: 'sdasdsadsadwqerwqdsadasdas',
    userInfo: JSON.parse(sessionStorage.getItem("userInfo")),
    studentInfo:JSON.parse(sessionStorage.getItem("studentInfo")),
    loginType:JSON.parse(sessionStorage.getItem("loginType"))
  },
  mutations: {
    //set
    SET_TOKEN: (state, token) => {
      state.token = token;
      localStorage.setItem("token", token);
    },
    SET_USERINFO: (state, userInfo) => {
      state.userInfo = userInfo;
      sessionStorage.setItem("userInfo", JSON.stringify(userInfo));
    },
    SET_LOGINTYPE: (state, loginType) => {
      state.loginType = loginType;
      sessionStorage.setItem("loginType", JSON.stringify(loginType));
    },
    SET_STUDENTINFO: (state, studentInfo) => {
      state.studentInfo = studentInfo;
      sessionStorage.setItem("studentInfo", JSON.stringify(studentInfo));
    },
    REMOVE_INFO: (state) => {
      state.token = "";
      state.userInfo = {};
      localStorage.setItem("token", "");
      sessionStorage.setItem("userInfo",JSON.stringify(""));
    },
    REMOVE_STUDENT_INFO: (state) => {
      state.token = "";
      state.studentInfo = {};
      localStorage.setItem("token", "");
      sessionStorage.setItem("studentInfo",JSON.stringify(""));
    },
  },
  getters: {
    //get
    getUserInfo:state=>{
      return state.userInfo;
    },
    getStudentInfo:state=>{
      return state.studentInfo;
    },
    getLoginType:state=>{
      return state.loginType;
    },
  },
  actions: {},
  modules: {}
})
