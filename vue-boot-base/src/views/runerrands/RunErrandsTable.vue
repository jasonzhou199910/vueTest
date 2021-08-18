<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-lx-cascades"></i>跑腿代购列表
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <menu-button @query-name="parentEvent"></menu-button>
        <el-input v-model="query.title" placeholder="请填写任务标题" class="handle-input mr10"></el-input>
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
          prop="id"
          label="任务编号"
          sortable
          width="50">
        </el-table-column>
        <el-table-column
          prop="title"
          label="任务标题"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="type"
          label="任务类型"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="commission"
          label="佣金"
          sortable
          width="50">
        </el-table-column>
        <el-table-column
          prop="arrivalTime"
          label="预计到达时间"
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
          prop="status"
          label="任务状态"
          sortable
          width="100">
          <template slot-scope="scope">
            {{enums.OrderStatusEnum.getLabelByValue(scope.row.status)}}
          </template>
        </el-table-column>
        <el-table-column
          prop="requireMent"
          label="任务要求"
          sortable
          width="180">
        </el-table-column>
        <el-table-column prop="createTime" label="发布时间"></el-table-column>
        <el-table-column  label="操作" >
          <template slot-scope="scope"  >
            <el-button v-if="scope.row.status==1"  type="success" v-on:click='receOrders(scope.row.id)'>接单</el-button>
            <el-button v-else-if="scope.row.status==2"  type="warning" disabled>已接单</el-button>
          </template>
          <template >

          </template>
        <!-- -->
        </el-table-column>
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
    <!-- 添加跑腿代购弹出框 -->
    <el-dialog title="添加跑腿代购" :visible.sync="addVisible" width="50%">
      <el-form :model="form" :rules="rules" ref="form" label-width="100px">
        <el-form-item label="任务标题" prop="title">
          <el-input v-model="form.title"></el-input>
        </el-form-item>
        <el-form-item label="任务类型" prop="type">
          <el-input v-model="form.type"></el-input>
        </el-form-item>
        <el-form-item label="任务佣金" prop="commission">
          <el-input-number v-model="form.commission" controls-position="right" :min="5" :max="1000"></el-input-number>
        </el-form-item>
        <el-form-item label="联系人" prop="person">
          <el-input v-model="form.person"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="mobile">
          <el-input v-model="form.mobile"></el-input>
        </el-form-item>
        <el-form-item label="预计达到时间" label-width="130px;" prop="arrivalTime" >
          <el-date-picker
            v-model="form.arrivalTime"
            type="datetime"
            placeholder="选择预计达到时间"
            align="right"
           >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="任务要求" prop="requireMent">
          <mavon-editor v-model="form.requireMent" ref="md" @imgAdd="$imgAdd" @change="change" style="min-height: 600px"/>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
                <el-button @click="addVisible = false">取 消</el-button>
                <el-button type="primary" @click="submitForm('form','add')">确 定</el-button>
            </span>
    </el-dialog>
    <!-- 编辑弹出框 -->
    <el-dialog title="编辑跑腿代购" :visible.sync="editVisible" width="80%">
      <el-form :model="form" :rules="rules" ref="form" label-width="100px">
        <el-form-item label="任务标题" prop="title">
          <el-input v-model="form.title"></el-input>
        </el-form-item>
        <el-form-item label="任务类型" prop="type">
          <el-input v-model="form.type"></el-input>
        </el-form-item>
        <el-form-item label="任务佣金" prop="commission">
          <el-input-number v-model="form.commission" :min="1" :max="100000" label="任务佣金"></el-input-number>
        </el-form-item>
        <el-form-item label="联系人" prop="person">
          <el-input v-model="form.person"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="mobile">
          <el-input v-model="form.mobile"></el-input>
        </el-form-item>
        <el-form-item label="预计达到时间" prop="rent">
          <el-date-picker
            v-model="form.arrivalTime"
            type="datetime"
            placeholder="选择预计达到时间"
            align="right"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="任务要求" prop="requireMent">
          <mavon-editor v-model="form.requireMent" ref="md" @imgAdd="$imgAdd" @change="change" style="min-height: 600px"/>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
                <el-button @click="editVisible = false">取 消</el-button>
                <el-button type="primary" @click="submitForm('form','edit')">确 定</el-button>
            </span>
    </el-dialog>

    <el-dialog
      title="交付押金"
      :visible.sync="depositStatusVisible"
      width="30%"
      >
      <span>跑腿是需要交付押金的，根据猿来入此章节法，为了保护双方的权益和利益，我们要实施的对双方进行信誉控制</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="deliverBond">交付押金</el-button>
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
            title:'',
            type: '',
            mobile: '',
            requireMent: '',
            commission:'',
            status:'',
            arrivalTime:'',
            createTime:'',
          }
        ],
        multipleSelection: [],
        delList: [],
        editVisible: false,
        addVisible: false,
        depositStatusVisible:false,
        pageTotal: 0,
        photo: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=512013533,3155536411&fm=26&gp=0.jpg',
        editHeadPic:'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=512013533,3155536411&fm=26&gp=0.jpg',
        form: {
          id: '',
          person: '',
          title:'',
          type: '',
          mobile: '',
          requireMent: '',
          commission:'',
          status:'',
          arrivalTime:'',
          arrivateDate:''
        },
        order:{
          id:'',
        },
        query: {
          title: '',
          currentPage: 1,
          pageSize: 10
        },
        idx: -1,
        rules: {
          title: [
            {required: true, message: '请输入任务标题', trigger: 'blur'},
            {min: 2, max: 10, message: '长度在 2 到10个字符', trigger: 'blur'}
          ],
          type: [
            {required: true, message: '请输入任务类型', trigger: 'blur'},
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
          person: [
            {required: true, message: '请填写联系人', trigger: 'blur'},
            {min: 2, max: 10, message: '长度在 2 到10个字符', trigger: 'blur'}
          ],
          requireMent: [
            {required: true, message: '请填写跑腿代购介绍', trigger: 'blur'},
            {min: 20, max: 100000, message: '跑腿代购介绍至少为20个字符', trigger: 'blur'}
          ],
          arrivalTime:[
            {required: true, message: '请填写预计到达时间', trigger: 'blur'},
          ]
        },
        menuUrl:'',
        addUrl:"",
        editUrl:"",
        deleteUrl:"",
      };
    },
    created() {
      //查一下是否开通跑腿服务了
      //从session中获取Id
      //根据Id获取Student信息 判断是否交跑腿押金
      var _that = this;
      const student= _that.$store.getters.getStudentInfo;
      const stuId=student.id;
      _that.$axios.post(_that.$base_url+"admin/student/check_deposit_status/"+stuId).then(result =>{
          const currentStudent=result.data.data;
          const status=currentStudent.depositStatus;
          if (status==0){
            _that.depositStatusVisible=true;
          }else{
            _that.depositStatusVisible=false;
          }
      }).catch(error=>{
        _that.$message.error(error);
      });
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
          url: _this.$base_url + 'admin/runErrands/list',
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
            option.title=content[i].title;
            option.type=content[i].type;
            option.person = content[i].person;
            option.mobile = content[i].mobile;
            option.requireMent = content[i].requireMent;
            option.commission = content[i].commission;
            option.status=content[i].status;
            option.arrivalTime=content[i].arrivalTime;
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
        //说明已经接单了！不可编辑
        if (selected[0].status==2){
          this.$message.warning("已经被人接单了,不可编辑!");
          return;
        }
        var id = selected[0].id;
        var _this = this;
        _this.$axios.get(_this.$base_url+_this.editUrl+"?id="+id).then(result=>{
          const runErrands=result.data.data;
          _this.form.id = runErrands.id;
          _this.form.title=runErrands.title;
          _this.form.type=runErrands.type;
          _this.form.person = runErrands.person;
          _this.form.mobile = runErrands.mobile;
          _this.form.requireMent = runErrands.requireMent;
          _this.form.commission = runErrands.commission;
          _this.form.status = runErrands.status;
          _this.form.arrivalTime=runErrands.arrivalTime;
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
              message: '跑腿代购订单删除成功',
              type: 'success'
            });
            this.$router.go(0);
          } else {
            this.$message.error(result.data.msg);
          }
        });
      },
      submitForm(formName,type) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            const _this = this;
            if (type =="add"){
              let time=_this.form.arrivalTime;
              _this.form.arrivalTime= _this.formateDate(time);
              _this.$axios.post(_this.$base_url + _this.addUrl, _this.form).then(result => {
                if (result.data.code == 0) {
                  //表示成功
                  this.$message({
                    message: '添加成功',
                    type: 'success'
                  });
                  const  student=result.data.data;
                  _this.$store.commit("SET_STUDENTINFO",student);
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
      },//交付押金
      deliverBond:function(){
        const _that=this;
        _that.$axios.post(_that.$base_url+"admin/runErrands/deposit_payment").then(result =>{
          const data=result.data;
          if (data.code==0){
            _that.$store.commit("SET_STUDENTINFO",data.data);
            _that.$message.success("支付成功,已交押金！")
            _that.depositStatusVisible=false;
          }else{
            _that.$message.error(data.msg);
          }
        }).catch(error =>{
          _that.$message.error(error)
        });
      },//接单
      receOrders:function(id){
        const _that=this;
        _that.order.id=id;
        _that.$axios.post(_that.$base_url+"/admin/runOrder/add",_that.order).then(result =>{
          if (result.data.code==0){
            _that.$message.success("接单成功!");
            _that.$router.go(0);
          }
        }).catch(error =>{
          _that.$message.error(error)
        })
      },
      dialogVisible:function(){
        const _that=this;
        _that.depositStatusVisible=false;
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
          console.log(url);
          this.$refs.md.$img2Url(pos, _this.$base_url+"photo/view?filename="+url.data.data);
        })
      },
      change(value, render){
        // render 为 markdown 解析后的结果
        this.html = render;
      },
      // 时间格式转换
      formateDate(time) {
        // 使用dayjs 把世界标准时间转换为北京时间
        let date = this.dayjs(time).format();
        // 把2020-09-30T02:02:02+08:00 截取出 '2020-9-30 2:2:2'
        const arr = date.split("T");
        const d = arr[0];
        const darr = d.split("-");
        const t = arr[1];
        const tarr = t.split(".000");
        const marr = tarr[0].split(":");
        const dd =
          parseInt(darr[0]) +
          "-" +
          parseInt(darr[1]) +
          "-" +
          parseInt(darr[2]) +
          " " +
          parseInt(marr[0]) +
          ":" +
          parseInt(marr[1]) +
          ":" +
          parseInt(marr[2]);
        console.log(dd) // 2020-9-30 2:2:2
        return dd;
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
  .el-form-item__label{
    width: 130px;
  }
</style>
