<template>
    <div class="login-wrap">
        <div class="ms-login">
            <div class="ms-title">校园管理系统</div>
            <el-form :model="loginForm" :rules="rules"   ref="ruleForm" label-width="0px" class="ms-content">
                <el-form-item prop="username">
                    <el-input v-model="loginForm.username" placeholder="username">
                        <el-button slot="prepend" icon="el-icon-user"></el-button>
                    </el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input
                        type="password"
                        placeholder="password"
                        v-model="loginForm.password"
                        @keyup.enter.native="submitForm('ruleForm')"
                    >
                        <el-button slot="prepend" icon="el-icon-lock"></el-button>
                    </el-input>
                </el-form-item>
                <div class="login-btn">
                    <el-button type="primary" @click="submitForm('ruleForm')">登录</el-button>
                </div>
                <p class="login-tips">Tips : 用户名和密码随便填。</p>
              <el-link type="success" href="/">学生登录</el-link>

            </el-form>
        </div>
    </div>
</template>

<script>
  var self =this;
  export default {
    data() {
      return {
        loginForm: {
          username: "",
          password: "",
          recode: false,
        },
        rules: {
          username: [
            {required: true, message: '请输入用户名', trigger: 'blur'},
            {min: 3, max: 15, message: '长度在 3 到 15 个字符', trigger: 'blur'}
          ],
          password: [
            {required: true, message: '请输入密码', trigger: 'change'}
          ]
        }
      };
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            const $this = this
            this.axios({
              method: 'post',
              url: $this.$base_url+'system/login',
              data: this.loginForm
            }).then((response)=> {
              const userInfo = response.data;
              if (response.data.code == 0) {
                self.$store.commit("SET_USERINFO", userInfo.data);
                self.$store.commit("SET_LOGINTYPE",1);
                this.$router.push({ path: "/dashboard"});
              } else {
                this.$message({
                  type:"info",
                  message:userInfo.msg
                })
              }
            });
          }else{
            this.$message({
              type:"info",
              message:"错误了！！"
            })
          };
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    },
    created(){
      self = this;
    }
  }
</script>

<style scoped>
.login-wrap {
    position: relative;
    width: 100%;
    height: 100%;
    background-image: url(../../assets/img/login-bg.jpg);
    background-size: 100%;
}
.ms-title {
    width: 100%;
    line-height: 50px;
    text-align: center;
    font-size: 20px;
    color: #fff;
    border-bottom: 1px solid #ddd;
}
.ms-login {
    position: absolute;
    left: 50%;
    top: 50%;
    width: 350px;
    margin: -190px 0 0 -175px;
    border-radius: 5px;
    background: rgba(255, 255, 255, 0.3);
    overflow: hidden;
}
.ms-content {
    padding: 30px 30px;
}
.login-btn {
    text-align: center;
}
.login-btn button {
    width: 100%;
    height: 36px;
    margin-bottom: 10px;
}
.login-tips {
    font-size: 12px;
    line-height: 30px;
    color: #fff;
}
</style>
