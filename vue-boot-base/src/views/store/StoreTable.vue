<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-lx-cascades"></i>店铺列表
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <menu-button @query-name="parentEvent"></menu-button>
        <el-input v-model="query.name" placeholder="店铺名称" class="handle-input mr10"></el-input>
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
          prop="photo"
          label="店铺封面"
          sortable
          width="180">
          <!-- 图片的显示 -->
          <template slot-scope="scope">
            <img :src="scope.row.photo" min-width="70" height="70"/>
          </template>
        </el-table-column>
        <el-table-column
          prop="name"
          label="店铺名称"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="storeType"
          label="店铺类型"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="area"
          label="店铺面积"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="rent"
          label="租金"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="deposit"
          label="押金"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="person"
          label="联系人"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="mobile"
          label="联系电话"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="address"
          label="店铺地址"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="status"
          label="店铺状态"
          sortable
          width="180">
          <template slot-scope="scope">
            {{enums.StoreTypeEnum.getLabelByValue(scope.row.storeStatus)}}
          </template>
        </el-table-column>
        <el-table-column
          prop="address"
          label="店铺介绍"
          sortable
          width="180">
        </el-table-column>
        <el-table-column prop="createTime" label="发布时间"></el-table-column>
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
    <!-- 添加店铺弹出框 -->
    <el-dialog title="添加店铺" :visible.sync="addVisible" width="80%">
      <el-form :model="form" :rules="rules" ref="form" label-width="100px">
        <el-avatar shape="square" :size="200" :fit="fits" :src="photo"></el-avatar>
        <el-upload
          class="avatar-uploader"
          :show-file-list="false"
          :action="basePath"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload">
          <i class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
        <el-form-item label="店铺名称" prop="name">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="店铺类型" prop="storeType">
          <el-input v-model="form.storeType"></el-input>
        </el-form-item>
        <el-form-item label="店铺面积" prop="area">
          <el-input placeholder="店铺面积" v-model="form.area">
            <template slot="append">.m²</template>
          </el-input>
        </el-form-item>
        <el-form-item label="联系人" prop="person">
          <el-input v-model="form.person"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="mobile">
          <el-input v-model="form.mobile"></el-input>
        </el-form-item>
        <el-form-item label="租金" prop="rent">
          <el-input-number v-model="form.rent" :min="1" :max="100000" label="租金"></el-input-number>
        </el-form-item>
        <el-form-item label="押金" prop="deposit">
          <el-input-number v-model="form.deposit" :min="1" :max="100000" label="押金"></el-input-number>
        </el-form-item>
        <el-form-item label="租期" prop="leaseTerm">
          <el-input v-model="form.leaseTerm"></el-input>
        </el-form-item>
        <el-form-item label="状态" prop="storeStatus">
          <el-select style="width: 99%" v-model="form.storeStatus" clearable placeholder="请选择">
          <el-option  v-for="item in enums.StoreTypeEnum" :key="item.value" :value="item.value" :label="item.label">
          </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="店铺地址" prop="address">
          <el-input v-model="form.address"></el-input>
        </el-form-item>
        <el-form-item label="店铺介绍" prop="info">
          <mavon-editor v-model="form.info" ref="md" @imgAdd="$imgAdd" @change="change" style="min-height: 600px"/>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
                <el-button @click="addVisible = false">取 消</el-button>
                <el-button type="primary" @click="submitForm('form','add')">确 定</el-button>
            </span>
    </el-dialog>
    <!-- 编辑弹出框 -->
    <el-dialog title="编辑店铺" :visible.sync="editVisible" width="80%">
      <el-form :model="form" :rules="rules" ref="form" label-width="100px">
        <el-avatar shape="square" :size="200" :fit="fits" :src="editHeadPic"></el-avatar>
        <el-upload
          class="avatar-uploader"
          :show-file-list="false"
          :action="basePath"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload">
          <i class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
        <el-form-item label="店铺名称" prop="name">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="店铺类型" prop="storeType">
          <el-input v-model="form.storeType"></el-input>
        </el-form-item>
        <el-form-item label="店铺面积" prop="area">
          <el-input placeholder="店铺面积" v-model="form.area">
            <template slot="append">.m²</template>
          </el-input>
        </el-form-item>
        <el-form-item label="联系人" prop="person">
          <el-input v-model="form.person"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="mobile">
          <el-input v-model="form.mobile"></el-input>
        </el-form-item>
        <el-form-item label="租金" prop="rent">
          <el-input-number v-model="form.rent" :min="1" :max="100000" label="租金"></el-input-number>
        </el-form-item>
        <el-form-item label="押金" prop="deposit">
          <el-input-number v-model="form.deposit" :min="1" :max="100000" label="押金"></el-input-number>
        </el-form-item>
        <el-form-item label="租期" prop="leaseTerm">
          <el-input v-model="form.leaseTerm"></el-input>
        </el-form-item>
        <el-form-item label="状态" prop="storeStatus">
          <el-select style="width: 99%" v-model="form.storeStatus" clearable placeholder="请选择">
            <el-option value="-1">--请选择状态--</el-option>
            <el-option  v-for="item in enums.StoreTypeEnum" :key="item.value" :value="item.value" :label="item.label">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="店铺地址" prop="address">
          <el-input v-model="form.address"></el-input>
        </el-form-item>
        <el-form-item label="店铺介绍" prop="info">
          <mavon-editor v-model="form.info" ref="md" @imgAdd="$imgAdd" @change="change" style="min-height: 600px"/>
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
  import  MenuButton from "../../components/common/MenuButton"
  import { mavonEditor } from 'mavon-editor'
  import 'mavon-editor/dist/css/index.css'
  import enums from '../../components/common/enums'
  export default {
    name: 'studentTable',
    components:{
      MenuButton,
      mavonEditor,
      enums
    },
    data() {
      return {
        enums:enums,
        fits: 'fill',
        tableData: [
          {
            id: '',
            person: '',
            name:'',
            address:'',
            photo: '',
            mobile: '',
            area: '',
            storeType: '',
            storeStatus: '3',
            rent: '',
            deposit: '',
            info: '',
            leaseTerm: '',
            createTime:'',
          }
        ],
        multipleSelection: [],
        delList: [],
        editVisible: false,
        addVisible: false,
        pageTotal: 0,
        photo: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=512013533,3155536411&fm=26&gp=0.jpg',
        editHeadPic:'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=512013533,3155536411&fm=26&gp=0.jpg',
        form: {
          id: '',
          person: '',
          name:'',
          address:'',
          photo: '',
          mobile: '',
          area: '',
          storeType: '',
          storeStatus: '',
          rent: '',
          deposit: '',
          info: '',
          leaseTerm: '',
        },
        selectRole: '',
        options: [{
          value: '-1',
          label: '请选择所属角色'
        }],
        query: {
          name: '',
          currentPage: 1,
          pageSize: 2
        },
        basePath: 'http://localhost:8085/upload/upload_photo',
        idx: -1,
        rules: {
          name: [
            {required: true, message: '请输入店铺名称', trigger: 'blur'},
            {min: 2, max: 10, message: '长度在 2 到10个字符', trigger: 'blur'}
          ],
          storeType: [
            {required: true, message: '请输入店铺类型', trigger: 'blur'},
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
          area: [
            {required: true, message: '请填写店铺面积', trigger: 'blur'},
          ],
          person: [
            {required: true, message: '请填写联系人', trigger: 'blur'},
            {min: 2, max: 10, message: '长度在 2 到10个字符', trigger: 'blur'}
          ],
          leaseTerm: [
            {required: true, message: '请填写租期', trigger: 'blur'},
            {min: 2, max: 10, message: '长度在 2 到10个字符', trigger: 'blur'}
          ],
          address: [
            {required: true, message: '请填写店铺地址', trigger: 'blur'},
          ],
          info: [
            {required: true, message: '请填写店铺介绍', trigger: 'blur'},
            {min: 20, max: 100000, message: '店铺介绍至少为20个字符', trigger: 'blur'}
          ],
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
      this.handlePageChange(1);
    },
    methods: {
      // 分页导航
      handlePageChange(val) {
        const _this = this;
        _this.query.currentPage=val;
        this.axios({
          method: 'post',
          url: _this.$base_url + 'admin/store/list',
          data: this.query,
        }).then((response) => {
          const result = response.data.data;
          _this.tableData.splice(0,_this.tableData.length)
          _this.tableData.shift();
          _this.pageTotal=result.total;
          _this.query.pageSize=result.pageSize;
          const content = result.content;
          for (var i = 0; i < content.length; i++) {
            var option = {};
            option.id = content[i].id;
            option.name=content[i].name;
            option.address=content[i].address;
            option.person = content[i].person;
            if (content[i].photo==""){
              option.photo ="static/img/img.jpg";
            }else{
              option.photo =_this.$base_url+"/photo/view?filename="+content[i].photo;
            }
            option.mobile = content[i].mobile;
            option.area = content[i].area;
            option.storeStatus = content[i].storeStatus;
            option.storeType = content[i].storeType;
            option.rent=content[i].rent;
            option.deposit=content[i].deposit;
            option.info=content[i].info;
            option.leaseTerm=content[i].leaseTerm;
            option.createTime = content[i].createTime;
            _this.tableData.push(option);
          }
        });
      },
      add() {
        const _that=this;
        _that.form.storeStatus=3;
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
          const store=result.data.data;
          _this.form.id = store.id;
          _this.form.name=store.name;
          _this.form.address=store.address;
          _this.form.person = store.person;
          if (store.photo==""){
            _this.form.photo ="";
          }else{
            _this.form.photo =_this.$base_url+"/photo/view?filename="+store.photo;
          }
          _this.form.mobile = store.mobile;
          _this.form.area = store.area;
          _this.form.storeStatus = store.storeStatus;
          _this.form.storeType = store.storeType;
          _this.form.rent=store.rent;
          _this.form.deposit=store.deposit;
          _this.form.info=store.info;
          _this.form.leaseTerm=store.leaseTerm;
          _this.form.reateTime =store.createTime;
          _this.editVisible=true;
        }).catch(err=>{
          console.log(err);
        });

      },
      deletes(){
        const _this=this;
      const selectedData=_this.multipleSelection;
     if (selectedData.length>1 || selectedData.length==0){
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
              message: '店铺删除成功',
              type: 'success'
            });
            this.$router.go(0);
          } else {
            this.$message.error(result.data.msg);
          }
        });
      },
      handleAvatarSuccess(res, file) {
        this.form.photo = res.data;
        this.photo = URL.createObjectURL(file.raw);
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
             if(_this.form.storeStatus==0){
               _this.$message({
                 message: '请选择店铺状态',
                 type: 'success'
               });
               return false;
            }
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
      },
      // 将图片上传到服务器，返回地址替换到md中
      $imgAdd(pos, $file){
        const _this=this;
        var formdata = new FormData();
        formdata.append('file', $file);
        // 这里没有服务器供大家尝试，可将下面上传接口替换为你自己的服务器接口
        _this.$axios({
          url: _this.$base_url+'/upload/upload_photo',
          method: 'post',
          data: formdata,
          headers: { 'Content-Type': 'multipart/form-data' },
        }).then((url) => {
          this.$refs.md.$img2Url(pos, _this.$base_url+"photo/view?filename="+url.data.data);
        })
      },
      change(value, render){
        // render 为 markdown 解析后的结果
        this.html = render;
      },
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
