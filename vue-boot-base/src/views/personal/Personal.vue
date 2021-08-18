<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item>
                    <i class="el-icon-lx-calendar"></i> 个人信息中心
                </el-breadcrumb-item>
                <el-breadcrumb-item>个人信息修改</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="form-box">
                <el-form ref="form" :model="form" :rules="rules"  label-width="80px">
                  <div class="grid-content bg-purple">
                    <el-image
                      style="width: 200px; height: 150px;"
                      :src="headPic"
                      :preview-src-list="srcList">
                    </el-image>
                    <el-upload
                      class="avatar-uploader"
                      :show-file-list="false"
                      :action="basePath"
                      :on-success="handleAvatarSuccess"
                      :before-upload="beforeAvatarUpload" style="float: left">
                      <i class="el-icon-plus avatar-uploader-icon"></i>
                    </el-upload>
                  </div>
                    <el-form-item label="名称" prop="name">
                        <el-input v-model="form.name" disabled></el-input>
                    </el-form-item>
                  <el-form-item label="手机号" prop="mobile">
                    <el-input v-model="form.mobile" prop="mobile"></el-input>
                  </el-form-item>

                  <el-form-item label="邮箱" prop="email">
                    <el-input v-model="form.email"></el-input>
                  </el-form-item>
                  <el-form-item label="性别" prop="sex">
                    <el-radio-group v-model="form.sex">
                      <el-radio label="1">男</el-radio>
                      <el-radio label="2">女</el-radio>
                      <el-radio label="3">未知</el-radio>
                    </el-radio-group>
                  </el-form-item>
                  <el-form-item label="押金状态" >
                    <el-input v-model="rechargeForm.status" disabled></el-input>
                  </el-form-item>
                  <el-form-item label="余额" >
                    <el-input v-model="rechargeForm.balance" disabled></el-input>
                  </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="onSubmit('form')">确认修改</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
      <el-divider content-position="left">充值中心</el-divider>
      <el-form :model="rechargeForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="充值金额" prop="money">
          <el-input-number v-model="rechargeForm.money" :step="100" :min="100":max="10000" ></el-input-number>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="rechargeForms('ruleForm')">立即充值</el-button>
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
      </el-form>
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
export default {
    name: 'personal',
    data() {
        return {
            form: {
              id:'',
                name: '',
                sex: '',
                email: '',
              headPic: 'https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg',
                mobile: '',
            },
          rechargeForm:{
              money:'100',
              status:'',
              balance:'',
          },
          srcList: [
           'https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg',
          ],
          headPic:'',
          basePath: 'http://localhost:8085/upload/upload_photo',
          rules: {
            name: [
              {required: true, message: '请输入名称', trigger: 'blur'},
              {min: 2, max: 10, message: '长度在 2 到10个字符', trigger: 'blur'}
            ],
            mobile: [
              {
                required: true,
                message: "请输入手机号码",
                trigger: "blur"
              },
              {
                validator: function (rule, value, callback) {
                  if (/^1[34578]\d{9}$/.test(value) == false) {
                    callback(new Error("手机号格式错误"));
                  } else {
                    callback();
                  }
                },
                trigger: "blur"
              }
            ],
            email: [
              {required: true, message: '请输入邮箱地址', trigger: 'blur'},
              {type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change']}
            ],
          /*  money: [
              {required: true, message: '请输入充值金额', trigger: 'blur'},
            ],*/
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
                  _this.$axios.post(_this.$base_url+"system/update_personal_info",_this.form).then(result=>{
                    const data=result.data;
                    if(data.code==0){
                      _this.$message.success("修改个人信息成功！");
                      _this.$store.commit("SET_USERINFO",data.data);
                      _this.$router.go(0);
                    }else{
                      _this.$message.success(data.msg);
                    }
                  }).catch(err=>{
                    this.$message.success(err);
                  });
                }else{
                  _this.$axios.post(_this.$base_url+"system/update_student_info",_this.form).then(result=>{
                    const data=result.data;
                    if(data.code==0){
                      _this.$message.success("修改个人信息成功！");
                      _this.$store.commit("SET_STUDENTINFO",data.data);
                      _this.$router.go(0);
                    }else{
                      _this.$message.success(data.msg);
                    }
                  }).catch(err=>{
                    this.$message.success(err);
                  });
                }
              } else {
                return false;
              }
          });

        },
      handleAvatarSuccess(res, file) {
          if(res.code!=0){
            this.$message({
              message: '图片大小不能超过1M',
              type: 'warning'
            });
            return;
          }else{
            this.form.headPic = res.data;
            this.headPic = URL.createObjectURL(file.raw);
          }
      },
      beforeAvatarUpload(file) {
        const _this = this;
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;
        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      },
      //重置金额
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      //确定充值
      rechargeForms:function (formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            //开始向后台发送请求
            const  _that=this;
            _that.$axios.post(_that.$base_url+"/system/rechargeMoney/"+ _that.rechargeForm.money).then(result =>{
              const data=result.data;
              if (data.code==0){
                _that.$store.commit("SET_STUDENTINFO",data.data);
                _that.$message.success("充值成功！");
                location.reload();
              }else{
                _that.$message.error(data.msg);
              }
            }).catch(error =>{
              _that.$message.error(error);
            })
          } else {
            console.log('error submit!!');
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
        _this.form.name=user.username;
        _this.form.mobile=user.mobile;
        _this.form.email=user.email;
        if (user.sex==0){
          _this.form.sex="0";
        }else if (user.sex==1){
          _this.form.sex="1";
        } else if (user.sex==2) {
          _this.form.sex="2";
        }else{
          _this.form.sex="3";
        }
        const arr= new Array();
        if(user.headPic=="" || user.headPic==null){
          _this.form.headPic="https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg";
          _this.headPic="https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg";
          arr.push("https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg");
        }else{
          _this.form.headPic=user.headPic;
          arr.push(_this.$base_url+"/photo/view?filename="+user.headPic);
          _this.headPic=_this.$base_url+"/photo/view?filename="+user.headPic;
        }
        _this.srcList=arr;
      }else{
        const student=_this.$store.getters.getStudentInfo;
        _this.form.id=student.id;
        _this.form.name=student.name;
        _this.form.mobile=student.mobile;
        _this.form.email=student.email;
        _this.rechargeForm.balance=student.balance;
        if (student.depositStatus==1){
          _this.rechargeForm.status="已交付"
        } else{
          _this.rechargeForm.status="未交付"
        }
        if (student.sex==0){
          _this.form.sex="0";
        }else if (student.sex==1){
          _this.form.sex="1";
        } else if (student.sex==2) {
          _this.form.sex="2";
        }else{
          _this.form.sex="3";
        }
        const arr= new Array();
        if(student.headPic=="" || student.headPic==null){
          _this.form.headPic="https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg";
          _this.headPic="https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg";
          arr.push("https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg");
        }else{
          _this.form.headPic=student.headPic;
          arr.push(_this.$base_url+"/photo/view?filename="+student.headPic);
          _this.headPic=_this.$base_url+"/photo/view?filename="+student.headPic;
        }
        _this.srcList=arr;
      }
    },

};
</script>
