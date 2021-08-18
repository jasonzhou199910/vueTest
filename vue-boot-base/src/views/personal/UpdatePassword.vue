<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item>
                    <i class="el-icon-lx-calendar"></i> 修改密码
                </el-breadcrumb-item>
                <el-breadcrumb-item>修改密码</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="form-box">
                <el-form ref="form" :model="form" :rules="rules"  label-width="100px">
                    <el-form-item label="旧密码" prop="password">
                        <el-input v-model="form.password" show-password></el-input>
                    </el-form-item>
                  <el-form-item label="新密码" prop="newPassword">
                    <el-input v-model="form.newPassword" show-password id="newPassword"></el-input>
                  </el-form-item>
                  <el-form-item label="确认新密码" prop="nPassword">
                    <el-input v-model="form.nPassword" show-password></el-input>
                  </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="onSubmit('form')">确认修改</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
    </div>
</template>
<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
<script>
  import $ from 'jquery';
export default {
    name: 'updatePassword',
    data() {
        return {
            form: {
              id:'',
              password:'',
              newPassword:'',
              nPassword:'',
            },
          rules: {
            password: [
              {required: true, message: '请输入旧密码', trigger: 'blur'},
              {min: 2, max: 20, message: '旧密码长度在 2 到10个字符', trigger: 'blur'}
            ],
            newPassword: [
              {required: true, message: '请输入新密码', trigger: 'blur'},
              {min: 2, max: 20, message: '新密码密码长度在 2 到10个字符', trigger: 'blur'}
            ],
            nPassword: [
              {required: true, message: '请输入确认密码', trigger: 'blur'},
              {min: 2, max: 20, message: '确认密码长度在 2 到10个字符', trigger: 'blur'},
              {
                validator: function (rule, value, callback) {
                  const newPassword=$("#newPassword").val();
                  if(value!=newPassword){
                    callback(new Error("两次密码不一致"));
                  } else {
                    callback();
                  }
                },
                trigger: "blur"
              }
            ]
          },
        };
    },
    methods: {
        onSubmit(formName) {
          this.$refs[formName].validate((valid) => {
              if (valid) {
                const _this=this;
                const loginType=_this.$store.getters.getLoginType;
                if(loginType==1){
                  const user=_this.$store.getters.getUserInfo;
                  _this.form.id=user.id;
                }else{
                  const student=_this.$store.getters.getStudentInfo;
                  _this.form.id=student.id;
                }
                _this.$axios.post(_this.$base_url+"system/update_password",_this.form).then(result=>{
                  const data=result.data;
                  if(data.code==0){
                    _this.$message.success("修改密码成功！");
                    _this.$router.go(0);
                  }else{
                    _this.$message.error(data.msg);
                  }
                }).catch(err=>{

                  this.$message.error(err);
                });
              } else {
                return false;
              }
          });
        },
    },
    created(){
      const _this=this;
      const loginType=_this.$store.getters.getLoginType;
      if(loginType==1){
        const user=_this.$store.getters.getUserInfo;
        _this.form.id=user.id;
      }
    }
};
</script>
