<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-lx-cascades"></i> 用户管理
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <menu-button @query-name="parentEvent"></menu-button>
        <el-input v-model="query.username" placeholder="用户名称" class="handle-input mr10"></el-input>
        <el-button type="primary" icon="el-icon-search" @click="handleSearch">搜索</el-button>
      </div>
      <el-table
        :data="tableData"
        row-key="id"
        border
        default-expand-all
        @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"></el-table-column>
        <el-table-column
          prop="headPic"
          label="头像"
          sortable
          width="180">
          <!-- 图片的显示 -->
          <template slot-scope="scope">
            <img :src="scope.row.headPic" min-width="70" height="70"/>
          </template>
        </el-table-column>
        <el-table-column
          prop="username"
          label="用户名称"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="role"
          label="所属角色"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="sex"
          label="用户性别"
          sortable
          width="180" :formatter="sexFormat">
        </el-table-column>
        <el-table-column
          prop="mobile"
          label="用户手机号"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="email"
          label="用户邮箱"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="status"
          label="用户状态"
          sortable
          width="180" :formatter="statusFormat">
        </el-table-column>
        <el-table-column prop="createTime" label="注册时间"></el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          background
          layout="total, prev, pager, next"
          :current-page="query.currentPage"
          :page-size="query.pageSize"
          :total="pageTotal"
          @current-change="handlePageChange"
          @next-click="nextClick"
          @prev-click="prevClick"
        ></el-pagination>
      </div>
    </div>

    <!-- 添加用户弹出框 -->
    <el-dialog title="添加用户" :visible.sync="addVisible" width="30%">
      <el-form :model="form" :rules="rules" ref="form" label-width="100px">
        <el-avatar shape="square" :size="100" :fit="fits" :src="headPic"></el-avatar>
        <el-upload
          class="avatar-uploader"
          :show-file-list="false"
          :action="basePath"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload">
          <i class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
        <el-form-item label="用户名称" prop="username">
          <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item label="用户密码" prop="password">
          <el-input v-model="form.password" show-password></el-input>
        </el-form-item>
        <el-form-item label="所属角色">
          <el-select v-model="selectRole" clearable placeholder="请选择所属角色">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="手机号码" prop="mobile">
          <el-input v-model="form.mobile"></el-input>
        </el-form-item>
        <el-form-item label="邮箱账号" prop="email">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-radio-group v-model="form.sex">
            <el-radio label="1">男</el-radio>
            <el-radio label="2">女</el-radio>
            <el-radio label="3">未知</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio label="1">正常</el-radio>
            <el-radio label="2">冻结</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
                <el-button @click="addVisible = false">取 消</el-button>
                <el-button type="primary" @click="submitForm('form','add')">确 定</el-button>
            </span>
    </el-dialog>
    <!-- 编辑弹出框 -->
    <el-dialog title="编辑用户" :visible.sync="editVisible" width="30%">
      <el-form :model="form" :rules="rules" ref="form" label-width="100px">
        <el-avatar shape="square" :size="100" :fit="fits" :src="editHeadPic"></el-avatar>
        <el-upload
          class="avatar-uploader"
          :show-file-list="false"
          :action="basePath"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload">
          <i class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
        <el-form-item label="用户名称" prop="username">
          <el-input v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item label="用户密码" prop="password">
          <el-input v-model="form.password" show-password></el-input>
        </el-form-item>
        <el-form-item label="所属角色">
          <el-select v-model="selectRole" clearable placeholder="请选择所属角色">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="手机号码" prop="mobile">
          <el-input v-model="form.mobile"></el-input>
        </el-form-item>
        <el-form-item label="邮箱账号" prop="email">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-radio-group v-model="form.sex">
            <el-radio label="1">男</el-radio>
            <el-radio label="2">女</el-radio>
            <el-radio label="3">未知</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio label="1">正常</el-radio>
            <el-radio label="2">冻结</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
                <el-button @click="editVisible = false">取 消</el-button>
                <el-button type="primary" @click="submitForm('form','edit')">确 定</el-button>
            </span>
    </el-dialog>
  </div>
</template>

<script>
  import  MenuButton from "../common/MenuButton"
  export default {
    name: 'userTable',
    components:{
      MenuButton
    },
    data() {
      return {
        fits: 'fill',
        tableData: [
          {
            id: '',
            username: '',
            headPic: '',
            mobile: '',
            sex: '',
            email: '',
            status: '',
            role: '',
            createTime: ''
          }
        ],
        multipleSelection: [],
        delList: [],
        editVisible: false,
        addVisible: false,
        pageTotal: 0,
        headPic: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3566088443,3713209594&fm=26&gp=0.jpg',
        editHeadPic:'',
        form: {
          id: '',
          username: '',
          headPic: '',
          mobile: '',
          sex: '1',
          email: '',
          status: '1',
          password: '',
          role: {},
        },
        selectRole: '',
        options: [{
          value: '-1',
          label: '请选择所属角色'
        }],
        query: {
          username: '',
          currentPage: 1,
          pageSize: 2
        },
        basePath: 'http://localhost:8085/upload/upload_photo',
        idx: -1,
        rules: {
          username: [
            {required: true, message: '请输入用户名称', trigger: 'blur'},
            {min: 2, max: 10, message: '长度在 2 到10个字符', trigger: 'blur'}
          ],
          password: [
            {required: true, message: '请输入用户密码', trigger: 'blur'},
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
            {required: true, message: '请输入用户邮箱地址', trigger: 'blur'},
            {type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change']}
          ]
        },
        menuUrl:'',
        addUrl:"",
        editUrl:"",
        deleteUrl:"",
      };
    },
    created() {
      var _that = this;
      _that.menuUrl=_that.$route.path;
      _that.$axios.get(_that.$base_url+"admin/role/findAll").then(result=>{
        const role=result.data.data;
        if (result.data.code==0){
          for (var i=0;i<role.length;i++){
            var option={};
            option.label=role[i].name;
            option.value =role[i].id;
            _that.options.push(option);
          }
        }
      });
      this.handlePageChange(1);
    },
    methods: {
      // 分页导航
      handlePageChange(val) {
        const _this = this;
        _this.query.currentPage=val;
        this.axios({
          method: 'post',
          url: _this.$base_url + 'admin/user/list',
          data: this.query,
        }).then((response) => {
          const result = response.data.data;
          _this.tableData.splice(0,_this.tableData.length)
          _this.tableData.shift();
          var arr = [];
          _this.pageTotal=result.total;
          _this.query.pageSize=result.pageSize;
          const content = result.content;
          for (var i = 0; i < content.length; i++) {
            var option = {};
            option.id = content[i].id;
            option.username = content[i].username;
            if (content[i].headPic==""){
              option.headPic ="static/img/img.jpg";
            }else{
              option.headPic =_this.$base_url+"/photo/view?filename="+content[i].headPic;
            }
            option.mobile = content[i].mobile;
            option.sex = content[i].sex;
            option.email = content[i].email;
            option.status = content[i].status;
            option.role = content[i].role.name;
            option.createTime = content[i].createTime;
            _this.tableData.push(option);
          }
        });
      },
      add() {
        const _that=this;
        _that.addVisible = true;
      },
      handleSelectionChange(val, index) {
        this.multipleSelection = val;
      },
      nextClick(val){
        this.handlePageChange(val);
      },
      handleSearch(){
        this.handlePageChange(this.query.currentPage);
      },
      prevClick(val){
        this.handlePageChange(val);
      },
      edit() {
        var selected = this.multipleSelection;
        if (selected.length != 1) {
          this.$message.warning("请选择一条数据进行编辑");
          return;
        }
        var id = selected[0].id;
        var _this = this;
        _this.$axios.get(_this.$base_url+_this.editUrl+"?id="+id).then(result=>{
           const user=result.data.data;
           _this.form.username =user.username;
           _this.form.id=user.id;
           _this.form.headPic=user.headPic;
           if (user.headPic==""){
             _this.editHeadPic="static/img/img.jpg";
           }else{
             _this.editHeadPic=_this.$base_url+"/photo/view?filename="+user.headPic;
           }
           _this.form.password=user.password;
          _this.form.mobile=user.mobile;
          if (user.sex==0){
            _this.form.sex="0";
          }else if (user.sex==1){
            _this.form.sex="1";
          } else if (user.sex==2) {
            _this.form.sex="2";
          }else{
            _this.form.sex="3";
          }
          _this.form.email =user.email;
          if (user.status ==1 ){
            _this.form.status="1";
          }else{
            _this.form.status="2";
          }
          _this.form.password=user.password;
          _this.selectRole =user.role.id;
          _this.headPic=_this.$base_url+"photo/view?filename="+user.headPic;
          _this.editVisible=true;
        }).catch(err=>{
          console.log(err);
        });

      },
      deletes(){
        const _this=this;
      const selectedData=_this.multipleSelection;
     if (selectedData.length>1){
       this.$message({
         message: '请选择一条数据进行删除',
         type: 'warning'
       });
     }
        var id=selectedData[0].id;
        _this.$axios.post(_this.$base_url + _this.deleteUrl+'?id='+id).then(result => {
          if (result.data.code == 0) {
            //表示成功
            this.$message({
              message: '用户删除成功',
              type: 'success'
            });
            this.$router.go(0);
          } else {
            this.$message.error(result.data.msg);
          }
        });
      },
      handleAvatarSuccess(res, file) {
        this.form.headPic = res.data;
        this.headPic = URL.createObjectURL(file.raw);
        this.editHeadPic=URL.createObjectURL(file.raw);
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
      submitForm(formName,type) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            const _this = this;
            if (_this.selectRole == -1 || _this.selectRole == "") {
              _this.$message.warning("请选择所属角色");
              return;
            }
            const option = {};
            option.id = _this.selectRole;
            _this.form.role = option;
            if (type =="add"){
              _this.$axios.post(_this.$base_url + _this.addUrl, _this.form).then(result => {
                if (result.data.code == 0) {
                  //表示成功
                  this.$message({
                    message: '添加成功',
                    type: 'success'
                  });
                  this.$router.go(0);
                } else {
                  this.$message.error(result.data.msg);
                }
              });
            }else{
              _this.$axios.post(_this.$base_url+_this.editUrl,_this.form).then(result=>{
                if (result.data.code == 0) {
                  //表示成功
                  this.$message({
                    message: '编辑成功',
                    type: 'success'
                  });
                  this.$router.go(0);
                } else {
                  this.$message.error(result.data.msg);
                }
              });
            }
          } else {
            return false;
          }
        });
      },
      sexFormat: function (row, column) {
        switch (row.sex) {
          case 1:
            return "男";
            break;
          case 2:
            return "女";
            break;
          case 3:
            return "未知";
            break;
        }
      },
      statusFormat: function (row, column) {
        if (row.status == 1) {
          return "正常";
        } else {
          return "不可用";
        }
      },
      parentEvent(data){
        const _this=this;
        _this.query.username=data;
      }
    }
  };
</script>

<style scoped>
  .handle-box {
    margin-bottom: 20px;
  }

  .handle-select {
    width: 120px;
  }

  .handle-input {
    width: 300px;
    display: inline-block;
  }

  .table {
    width: 100%;
    font-size: 14px;
  }

  .red {
    color: #ff0000;
  }

  .mr10 {
    margin-right: 10px;
  }

  .table-td-thumb {
    display: block;
    margin: auto;
    width: 40px;
    height: 40px;
  }

  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    width: 100px;
    height: 150px;
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

  .el-upload--text {
    width: 100px;
    height: 180px;
  }
</style>
