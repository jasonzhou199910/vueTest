<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-lx-cascades"></i> 日志管理
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <el-button
          type="primary"
          icon="el-icon-delete"
          class="handle-del mr10"
          @click="deleteLog"
        >删除</el-button>
        <el-input v-model="query.operator" placeholder="操作人" class="handle-input mr10"></el-input>
        <el-button type="primary" icon="el-icon-search" @click="handleSearch">搜索</el-button>
      </div>
      </div>
      <el-table
        :data="tableData"
        row-key="id"
        border
        default-expand-all
        @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"></el-table-column>
        <el-table-column
          prop="operator"
          label="操作者"
          sortable
          width="180">
        </el-table-column>
        <el-table-column
          prop="content"
          label="日志内容"
          sortable
          width="180">
        </el-table-column>
        <el-table-column prop="createTime" label="添加时间"></el-table-column>
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
            operator: '',
            content:'',
          }
        ],
        multipleSelection: [],
        delList: [],
        editVisible: false,
        addVisible: false,
        pageTotal: 0,
        headPic: '',
        editHeadPic:'',
        selectRole: '',
        query: {
          operator:'',
          currentPage: 1,
          pageSize: 10
        },
        idx: -1,
      };
    },
    created() {
      this.handlePageChange(1);
    },
    methods: {
      // 分页导航
      handlePageChange(val) {
        const _this = this;
        _this.query.currentPage=val;
        this.axios({
          method: 'post',
          url: _this.$base_url + 'system/log_list',
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
            option.operator = content[i].operator;
            option.content=content[i].content;
            option.createTime = content[i].createTime;
            _this.tableData.push(option);
          }
        });
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
      deleteLog(){
        const _that=this;
        const selected= _that.multipleSelection;
        var  ids="";
        for (let i=0;i<selected.length;i++){
          ids+=selected[i].id+",";
        }
       _that.$axios.post(_that.$base_url+'system/delete_operator_log',ids,{headers: {
           'Content-Type': 'application/json;charset=UTF-8'
         }}).then(result =>{
      if (result.data.code==0){
        //表示成功
        _that.$router.go(0);
      }else{
        //表示失败
        _that.$message.error(result.data.msg);
        return;
      }
       });
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
