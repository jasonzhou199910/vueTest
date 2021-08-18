<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-lx-cascades"></i>接单列表
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <el-button type="primary" icon="el-icon-aim" v-on:click="end">
          完成
        </el-button>
        <el-input v-model="query.orderNo" placeholder="请填写订单编号" class="handle-input mr10"></el-input>
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
          prop="orderNo"
          label="订单编号"
          sortable
          width="200">
        </el-table-column>
        <el-table-column
          prop="title"
          label="任务标题"
          sortable
          width="100">
        </el-table-column>
        <el-table-column
          prop="type"
          label="任务类型"
          sortable
          width="80">
        </el-table-column>
        <el-table-column
          prop="arrivalTime"
          label="预计到达时间"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="person"
          label="接单人"
          sortable
          width="120">
        </el-table-column>
        <el-table-column
          prop="mobile"
          label="手机号"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="status"
          label="订单状态"
          sortable
          width="100">
          <template slot-scope="scope">
            {{enums.OrderStatusEnum.getLabelByValue(scope.row.status)}}
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="接单时间"  ></el-table-column>
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
            orderNo: '',
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
        query: {
          orderNo: '',
          currentPage: 1,
          pageSize: 10
        },
        idx: -1,
        menuUrl:'',
        addUrl:"",
        editUrl:"",
        deleteUrl:"",
      };
    },
    created() {
      const _that = this;
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
          url: _this.$base_url + 'admin/runOrder/list',
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
            option.orderNo=content[i].orderNo;
            option.title=content[i].runErrands.title;
            option.type=content[i].runErrands.type;
            option.person = content[i].student.name;
            option.mobile = content[i].student.mobile;
            option.status=content[i].status;
            option.arrivalTime=content[i].runErrands.arrivalTime;
            option.createTime = content[i].createTime;
            _this.tableData.push(option);
          }
        });
      },
      end() {
        const _that=this;
        var selected = _that.multipleSelection;
        if (selected.length != 1) {
          _that.$message.warning("请选择一条数据进行操作");
          return;
        }
        if (selected[0].status==3){
          _that.$message.warning("当前订单已完成!");
          return;
        }
        const orderId=selected[0].id;
        _that.$axios.post(_that.$base_url+"admin/runOrder/end?id="+orderId).then(result =>{
          if (result.data.code==0){
            const student=result.data.data;
            _that.$store.commit("SET_STUDENTINFO",student);
            _that.$message.success("完成任务!");
            _that.$router.go(0);
          }else{
            _that.$message.error(result.data.msg);
          }
        })
      },
      parentEvent(data){
        const _this=this;
        _this.query.orderNo=data;
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
