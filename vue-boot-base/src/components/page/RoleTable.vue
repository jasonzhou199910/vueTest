<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-lx-cascades"></i> 角色管理
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <el-button
          type="primary"
          icon="el-icon-add-location"
          class="handle-del mr10"
          @click="addRole"
        >添加</el-button>
        <el-button
          type="primary"
          icon="el-icon-edit"
          class="handle-del mr10"
          @click="editRole"
        >编辑</el-button>
        <el-button
          type="primary"
          icon="el-icon-delete"
          class="handle-del mr10"
          @click="deleteRole"
        >删除</el-button>
        <el-input v-model="query.name" placeholder="用户名" class="handle-input mr10"></el-input>
        <el-button type="primary" icon="el-icon-search" @click="handleSearch">搜索</el-button>
      </div>
      <el-table
        :data="tableData"
        border
        class="table"
        ref="multipleTable"
        header-cell-class-name="table-header"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="55" align="center"></el-table-column>
        <el-table-column prop="id" label="ID" width="55" align="center"></el-table-column>
        <el-table-column prop="name" label="角色名称"></el-table-column>
        <el-table-column label="角色状态" align="center">
          <template slot-scope="scope">
            <el-tag
              :type="scope.status"
            >{{scope.row.status==1?"正常":"冻结"}}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="remark" label="角色备注"></el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          background
          layout="total, prev, pager, next"
          :current-page="query.currentPage"
          :page-size="query.pageSize"
          :total="pageTotal"
          @current-change="handlePageChange"
        ></el-pagination>
      </div>
    </div>

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑角色" :visible.sync="editVisible"  width="30%">
      <el-form :model="form" :rules="rules" ref="role" label-width="70px">
        <el-form-item label="角色名称" prop="name">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <label class="el-form-item__label" style="width: 80px;margin-left: 20px;">角色权限</label>
        <el-table
          :data="roleData"
          ref="multipleTable"
          :row-key="getRowKeys"
         @selection-change="MenuSelectionChangeEdit"
        >
          <el-table-column type="selection" :reserve-selection="true" width="55" align="center"></el-table-column>
          <el-table-column
            prop="name"
            label="菜单名称"
            sortable
            width="180">
          </el-table-column>
        </el-table>
        <el-form-item label="角色状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio label="1">正常</el-radio>
            <el-radio label="2">冻结</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注"  prop="remark">
          <el-input v-model="form.remark"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
                <el-button @click="editVisible = false">取 消</el-button>
                <el-button type="primary" @click="saveEdit('role')">确 定</el-button>
            </span>
    </el-dialog>

    <!-- 添加角色弹出框 -->
    <el-dialog title="添加角色" :visible.sync="addVisible" width="30%">
      <el-form :model="role" :rules="rules" ref="role" label-width="100px" class="demo-ruleForm">
        <el-form-item label="角色名称" prop="name">
          <el-input v-model="role.name" placeholder="请选择角色名称"></el-input>
        </el-form-item>
        <label class="el-form-item__label" style="width: 80px;margin-left: 20px;">角色权限</label>
        <el-table
          :data="roleData"
          :multiple="true"
          row-key="id"
          border
          type="expand" @selection-change="MenuSelectionChange"
        >
          <el-table-column type="selection" :reserve-selection="true" width="55" align="center"></el-table-column>
          <el-table-column
            prop="name"
            label="菜单名称"
            sortable
            width="180">
          </el-table-column>
        </el-table>
        <el-form-item label="角色状态" prop="status">
          <el-radio-group v-model="role.status">
            <el-radio label="1">正常</el-radio>
            <el-radio label="2">冻结</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="角色备注">
          <el-input type="textarea" rows="5" v-model="role.remark"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('role')">立即创建</el-button>
          <el-button @click="resetForm('form')">重置</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
    export default {
        name: 'roleTable',
        data() {
            return {
              getRowKeys(row){
                return row.id;
              },
              tableData: [
                {
                  id:'',
                  name: '',
                  status:'1',
                  remark:"",
                }
              ],
              multipleSelection: [],
              delList: [],
              editVisible: false,
              addVisible:false,
              pageTotal: 0,
              form: {
                id:'',
                name: '',
                status:'1',
                remark:"",
              },
              idx: -1,
              query: {
                name: '',
                currentPage: 1,
                pageSize: 10
              },
              rules: {
                name: [
                  { required: true, message: '请填写角色名称', trigger: 'blur' },
                  { min: 1, max: 5, message: '长度在 2 到 5 个字符', trigger: 'blur' }
                ]
              },
              role: {
                name: '',
                status:'1',
                remark:'',
                authorities:''
              },
              roleData: [
                {
                  id:'',
                  name: '',
                  url:'',
                  parent:{
                    name: ''
                  },
                  icon:'',
                  sort:'',
                  isButton:'',
                  isShow:'',
                  children: [{
                    id: 'one',
                    name: '',
                    url:'',
                    parent:{
                      name: ''
                    },
                    icon:'',
                    sort:'',
                    isButton:'',
                    isShow:'',
                  },],
                }
              ],
            };
        },
        methods: {
          addRole() {
            const _this=this;
            this.axios({
              method: 'post',
              url: _this.$base_url+'admin/menu/list',
              data:this.query,
            }).then((response)=> {
              const result=response.data.data;
              _this.roleData.shift();
              var arr=[];
              for (var i=0;i<result.length;i++){
                if (arr.indexOf(result[i].id)<=-1){
                  var option={};
                  option.id = result[i].id;
                  option.url = result[i].url;
                  option.parent = result[i].parent;
                  option.name = result[i].name;
                  option.icon = result[i].icon;
                  option.sort = result[i].sort;
                  option.isButton = result[i].isButton;
                  option.isShow = result[i].isShow;
                  if (result[i].parent!=null) {
                    //表示不是一级开始
                    var chilrend=new Array();
                    for (var j=0;j<result.length;j++){
                      if (result[j].parent!=null){
                        if (result[i].id==result[j].parent.id){
                          arr.push(result[j].id);
                          var children={};
                          children.id = result[j].id;
                          children.url = result[j].url;
                          children.parent = result[j].parent;
                          children.name = result[j].name;
                          children.icon = result[j].icon;
                          children.sort = result[j].sort;
                          children.isButton = result[j].isButton;
                          children.isShow = result[j].isShow;
                          chilrend.push(children);
                        }
                      }
                    }
                    option.children=chilrend;
                  }
                  _this.roleData.push(option);
                }
              }
              _this.addVisible=true;
            });

          },
          // 触发搜索按钮
          handleSearch() {
            this.$set(this.query, 'index', 1);
            this.handlePageChange();
          },
          handlePageChange(val) {
            const _this = this;
            _this.query.currentPage=val;
            this.axios({
              method: 'post',
              url: _this.$base_url + 'admin/role/list',
              data:  _this.query,
            }).then((response) => {
              const result = response.data.data;
              _this.tableData.shift();
              _this.tableData=result.content;
             _this.pageTotal=result.total;
             _this.query.pageSize=result.pageSize;
            })
          },
          editRole(){
            const _that=this;
            var selected= _that.multipleSelection;
            if (selected.length!=1){
              this.$message.warning("请选择一条数据进行编辑");
              return;
            }
            var id=selected[0].id;
            _that.$axios.get(_that.$base_url+"/admin/role/edit_role/"+id).then(result=>{
              const currentMenu=result.data.data.currentMenu;
              for (let k=0;k<_that.roleData.length;k++){
                const  allRole=_that.roleData[k];
                for (let p=0;p<currentMenu.length;p++){
                  if (allRole.id==currentMenu[p].id){
                      if (allRole.parent!=null){
                        for (let q=0;q<allRole.children.length;q++){
                          for (let l=0;l<currentMenu.length;l++){
                            if (allRole.children[q].id ==currentMenu[l].id){
                              _that.$refs.multipleTable.toggleRowSelection(_that.roleData[k].children[q],true);
                              break;
                            }
                          }
                        }
                      }
                    _that.$refs.multipleTable.toggleRowSelection( _that.roleData[k],true);
                    break;
                  }
                }
              }
            });
            _that.$axios.get(_that.$base_url+"admin/role/edit?id="+id).then(result=>{
             const data= result.data;
             _that.form.id=data.id;
             _that.form.name=data.name;
              if (data.status==1){
                _that.form.status="1";
              } else{
                _that.form.status="2";
              }
             _that.form.remark=data.remark;
              _that.editVisible=true;
            });
          },
          deleteRole(){
            const _that=this;
            var selected= _that.multipleSelection;
            if (selected.length!=1){
              this.$message.warning("请选择一条数据进行删除");
              return;
            }
            var id=selected[0].id;
            _that.$axios.post(_that.$base_url+"admin/role/delete?id="+id).then(result =>{
              if (result.data.code==0){
                _that.$alert("删除成功", '删除成功', {
                  confirmButtonText: '确定',
                  callback: action => {
                    _that.$router.go(0);
                  }
                });
              }else{
                _that.$message.error(result.data.msg);
              }
            }).catch(error =>{
              _that.$message.error(error);
            });
          },
          handleSelectionChange(val,index) {
            this.multipleSelection=val;
          },
          saveEdit(formName) {
            this.$refs[formName].validate((valid) => {
              if (valid) {
                const _that=this;
               _that.form.authorities=_that.role.authorities;
                _that.$axios.post(_that.$base_url+"admin/role/edit",_that.form).then(result =>{
                  if (result.data.code==0){
                    _that.editVisible = false;
                    _that.$message.success("角色编辑成功");
                    _that.$set(this.tableData, this.idx, this.form);
                    _that.$router.go(0);
                  }
                }).catch(error =>{
                    _that.$message.error(error);
                });
              }
            });
          },
          MenuSelectionChange(val,index){
            var arr=[];
            for (var i=0;i<val.length;i++){
              var option={};
              option.id = val[i].id;
              arr.push(option);
              const chilrend=val[i].children;
              if (chilrend){
                var optio={};
                for (var j=0;j<chilrend.length;j++){
                  optio.id = chilrend[j].id;
                  arr.push(optio);
                }
              }
            }
            this.role.authorities=arr;
          },
          MenuSelectionChangeEdit(val,index){
            var arr=[];
            for (var i=0;i<val.length;i++){
              var option={};
              option.id=val[i].id;
              arr.push(option);
            }
            this.role.authorities=arr;
          },
          submitForm(formName) {
            this.$refs[formName].validate((valid) => {
              if (valid) {
                const that=this;
                that.$axios.post(that.$base_url+'admin/role/add',{
                  name:that.role.name,
                  status:that.role.status,
                  remark:that.role.remark,
                  authorities:that.role.authorities,
                }).then(result =>{
                  if (result.data.code==0){
                    //表示成功
                    this.$message({
                      message: '添加成功',
                      type: 'success'
                    });
                    this.$router.go(0);
                  }else{
                    this.$message.error(result.data.msg);
                  }
                });
              } else {
                console.log('error submit!!');
                return false;
              }
            });
          },
          resetForm(formName) {
            this.$refs[formName].resetFields();
          },
          addgsForm(){
            this.dialogAddgsVisible = true;
            let thit = this
            thit.$axios.get("/static/icon.json").then(res => {
              thit.icon =res.data.icon;
            });
          },
          closeDialogAddgsVisible(){
            this.dialogAddgsVisible=false;
          },
        },
      created() {
        this.handlePageChange(1);
        const _this=this;
        _this.axios({
          method: 'post',
          url: _this.$base_url+'admin/menu/list',
          data:this.query,
        }).then((response)=> {
          const result=response.data.data;
          _this.roleData.shift();
          var arr=[];
          for (var i=0;i<result.length;i++){
            if (arr.indexOf(result[i].id)<=-1){
              var option={};
              option.id = result[i].id;
              option.url = result[i].url;
              option.parent = result[i].parent;
              option.name = result[i].name;
              option.icon = result[i].icon;
              option.sort = result[i].sort;
              option.isButton = result[i].isButton;
              option.isShow = result[i].isShow;
              if (result[i].parent!=null) {
                //表示不是一级开始
                var chilrend=new Array();
                for (var j=0;j<result.length;j++){
                  if (result[j].parent!=null){
                    if (result[i].id==result[j].parent.id){
                      arr.push(result[j].id);
                      var children={};
                      children.id = result[j].id;
                      children.url = result[j].url;
                      children.parent = result[j].parent;
                      children.name = result[j].name;
                      children.icon = result[j].icon;
                      children.sort = result[j].sort;
                      children.isButton = result[j].isButton;
                      children.isShow = result[j].isShow;
                      chilrend.push(children);
                    }
                  }
                }
                option.children=chilrend;
              }
              _this.roleData.push(option);
            }
          }
        });
      },
    }

</script>

<style>
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
</style>

