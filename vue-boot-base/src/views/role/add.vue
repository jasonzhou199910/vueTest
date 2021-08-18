<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-lx-calendar"></i> 角色管理
        </el-breadcrumb-item>
        <el-breadcrumb-item>添加角色</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="form-box">
        <el-form :model="role" :rules="rules" ref="role" label-width="100px" class="demo-ruleForm">
          <el-form-item label="角色名称" prop="name">
            <el-input v-model="role.name" placeholder="请选择角色名称"></el-input>
          </el-form-item>
          <label class="el-form-item__label" style="width: 80px;margin-left: 20px;">角色权限</label>
          <el-table
            :data="tableData"
            :multiple="true"
            row-key="id"
            border
            type="expand"  @selection-change="handleSelectionChange"
          >
            <el-table-column type="selection" width="55" align="center"></el-table-column>
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
      </div>
    </div>
  </div>

</template>
<script>
  import Treeselect from '@riophae/vue-treeselect'
  import '@riophae/vue-treeselect/dist/vue-treeselect.css'
  export default {
    name: 'roleAdd',
    components: {
      Treeselect
    },
    data() {
      return {
        role: {
          name: '',
          status:'1',
          remark:'',
          authorities:''
        },
        multipleSelection:'',
        tableData: [
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
        rules: {
          name: [
            { required: true, message: '请填写角色名称', trigger: 'blur' },
            { min: 1, max: 5, message: '长度在 2 到 5 个字符', trigger: 'blur' }
          ]
        },
      };
    },
    methods: {
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
                this.$router.push({ path: "/menu"});
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
      handleSelectionChange(val,index) {
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
    created(){
      const _this=this;
      this.axios({
        method: 'post',
        url: _this.$base_url+'admin/menu/list',
        data:this.query,
      }).then((response)=> {
        const result=response.data.data;
        _this.tableData.shift();
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
            _this.tableData.push(option);
          }
        }
      });
    }
  };
</script>
<style scoped>
  .example-p{
    height: 45px;
    display: flex;
    align-items: center;
  }
  .search-box{
    text-align: center;
    margin-top: 10px;
  }
  .search{
    width: 300px;
  }
  ul,li{
    list-style: none;
  }
  .icon-li{
    display: inline-block;
    padding: 10px;
    width: 120px;
    height: 120px;
  }
  .icon-li-content{
    display: flex;
    height: 100%;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    cursor: pointer;
  }
  .icon-li-content i{
    font-size: 36px;
    color: #606266;
  }
  .icon-li-content span{
    margin-top: 10px;
    color: #787878;
  }

</style>
