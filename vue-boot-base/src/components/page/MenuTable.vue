<template>
    <div>
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item>
                    <i class="el-icon-lx-cascades"></i> 菜单管理
                </el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="handle-box">
              <menu-button @query-name="parentEvent"></menu-button>
            </div>
          <el-table
            :data="tableData"
            row-key="id"
            border
            default-expand-all
            :tree-props="{children: 'children', hasChildren: 'hasChildren'}" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55" align="center"></el-table-column>
            <el-table-column
              prop="name"
              label="菜单名称"
              sortable
              width="180">
            </el-table-column>
            <el-table-column
              prop="parent.name"
              label="菜单父分类"
              sortable
              width="180">
            </el-table-column>
            <el-table-column
              prop="url"
              label="菜单url"
              sortable
              width="180">
            </el-table-column>
            <el-table-column
              prop="icon"
              label="菜单图标icon"
              sortable
              width="180">
            </el-table-column>
            <el-table-column
              prop="sort"
              label="菜单顺序"
              sortable
              width="180">
            </el-table-column>
            <el-table-column label="是否按钮" align="center">
              <template slot-scope="scope">
                <el-tag
                  :type="scope.row.isButton"
                >{{scope.row.isButton}}</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="是否显示" align="center">
              <template slot-scope="scope">
                <el-tag
                  :type="scope.row.isShow"
                >{{scope.row.isShow}}</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="createTime" label="注册时间" ></el-table-column>
          </el-table>
        </div>
  <el-dialog title="添加菜单" :visible.sync="addVisible" width="30%">
    <el-form :model="form" :rules="rules" ref="form" label-width="100px" class="demo-ruleForm">
      <el-form-item label="请选择上级分类">
        <treeselect v-model="form.parentId"  :options="options" />
      </el-form-item>
      <el-form-item label="菜单名称" prop="name">
        <el-input v-model="form.name" placeholder="请选择菜单名称"></el-input>
      </el-form-item>
      <el-form-item label="菜单Url" prop="url">
        <el-input v-model="form.url" placeholder="请选择菜单Url"></el-input>
      </el-form-item>
      <el-form-item label="菜单ICON" prop="icon" >
        <el-input v-model="form.icon" readonly="readonly" placeholder="请选择icon"></el-input>
        <el-button type="success" @click="addgsForm" icon="el-icon-plus">新增</el-button>
      </el-form-item>
      <el-form-item label="排序" prop="sort">
        <el-input-number v-model="form.sort"  placeholder="请输入排序" :min="1" :max="1000"  label="排序"></el-input-number>
      </el-form-item>
      <el-form-item label="是否按钮" prop="isButton">
        <el-radio-group v-model="form.isButton">
          <el-radio label="1">是</el-radio>
          <el-radio label="2">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="是否显示" prop="isShow">
        <el-radio-group v-model="form.isShow">
          <el-radio label="1">是</el-radio>
          <el-radio label="2">否</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
                <el-button @click="addVisible = false">取 消</el-button>
                <el-button type="primary" @click="submitForm('form','add')">确 定</el-button>
            </span>
  </el-dialog>

      <el-dialog :title="title" :visible.sync="dialogAddgsVisible"  @close="closeDialogAddgsVisible">
        <ul>
          <li class="icon-li" v-for="(item,index) in icon" :key="'icon'+index">
            <div data-v-78dfadcd="" class="icon-li-content">
              <i data-v-78dfadcd="" :class="`${item}`" @click="selectIcon"></i>
              <span data-v-78dfadcd="">{{item}}</span>
            </div>
          </li>

        </ul>
      </el-dialog>


      <el-dialog title="编辑菜单" :visible.sync="editVisible" width="30%">
        <el-form :model="form" :rules="rules" ref="form" label-width="100px" class="demo-ruleForm">
          <el-form-item label="请选择上级分类">
            <treeselect v-model="form.parentId"  :options="options" />
          </el-form-item>
          <el-form-item label="菜单名称" prop="name">
            <el-input v-model="form.name" placeholder="请选择菜单名称"></el-input>
          </el-form-item>
          <el-form-item label="菜单Url" prop="url">
            <el-input v-model="form.url" placeholder="请选择菜单Url"></el-input>
          </el-form-item>
          <el-form-item label="菜单ICON" prop="icon" >
            <el-input v-model="form.icon" readonly="readonly" placeholder="请选择icon"></el-input>
            <el-button type="success" @click="addgsForm" icon="el-icon-plus">新增</el-button>
          </el-form-item>
          <el-form-item label="排序" prop="sort">
            <el-input-number v-model="form.sort"  placeholder="请输入排序" :min="1" :max="10000"  label="排序"></el-input-number>
          </el-form-item>
          <el-form-item label="是否按钮" prop="isButton">
            <el-radio-group v-model="form.isButton">
              <el-radio label="1">是</el-radio>
              <el-radio label="2">否</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="是否显示" prop="isShow">
            <el-radio-group v-model="form.isShow">
              <el-radio label="1">是</el-radio>
              <el-radio label="2">否</el-radio>
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
  import Treeselect from '@riophae/vue-treeselect'
  import '@riophae/vue-treeselect/dist/vue-treeselect.css'
  import  MenuButton from "../common/MenuButton"

  export default {
    name: 'menuTable',
  components: {
    Treeselect,
    MenuButton
  },
    data() {
        return {
          editVisible: false,
          addVisible: false,
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
                  createTime:"",
                },],
                createTime:"",
              }
            ],
            multipleSelection: [],
            delList: [],
            pageTotal: 0,
            idx: -1,
          form: {
            id:'',
            name: '',
            parentId: null,
            url: '',
            icon: '',
            sort: '0',
            isButton: '1',
            isShow: '1',
            button:'',
            show:'',
          },
          value: 1,
          options: [ {
            id:'-1',
            label: '请选择上级分类',
            children: [ {
              id: '',
              label:'',
            }],
          } ],
          rules: {
            name: [
              { required: true, message: '请填写菜单名称', trigger: 'blur' },
              { min: 1, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur' }
            ],
            parentId: [
              { required: true, message: '请选择上级分类', trigger: 'change' }
            ]
          },
          title:"",
          showModal:false,
          dialogAddgsVisible:false,
          icon:[],
          menuUrl:'',
          addUrl:"",
          editUrl:"",
          deleteUrl:"",
        };
    },
    created() {
      var _that=this;
      _that.menuUrl=_that.$route.path;
      this.handlePageChange(1);
    },
    methods: {
        // 分页导航
        handlePageChange(val) {
          const _this=this;
          this.axios({
            method: 'post',
            url: _this.$base_url+'admin/menu/list',
            data:this.query,
            dataType:'json'
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
                option.createTime=result[i].createTime;
                if(result[i].show==true){
                  option.isShow ="是";
                }else{
                  option.isShow ="否";
                }
                if(result[i].button==true){
                  option.isButton = "是";
                }else{
                  option.isButton = "否";
                }
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
                        if(result[j].show==true){
                          children.isShow  ="是";
                        }else{
                          children.isShow  ="否";
                        }
                        if(result[j].button==true){
                          children.isButton = "是";
                        }else{
                          children.isButton = "否";
                        }
                        children.createTime=result[j].createTime;
                        chilrend.push(children);
                      }
                    }
                  }
                  option.children=chilrend;
                }
                _this.tableData.push(option);
              }
            }
          }).catch(error =>{
            if (error=="还未登录或会话失效，请重新登录！"){
              _this.$router.push("/");
              return;
            }
          });
        },
      add(){
        var _this=this;
        _this.$axios.post(_this.$base_url+'admin/menu/menu_add').then(result => {
          const menuData=result.data.data;
          const secondMenus=menuData.secondMenus;
          const topMenus=menuData.topMenus;
          _this.options=new Array();
          for (var i=0;i<topMenus.length;i++){
            var option={};
            option.id=topMenus[i].id;
            option.label = topMenus[i].name;
            var arr= new Array();
            for (var j=0;j<secondMenus.length;j++){
              if (topMenus[i].id==secondMenus[j].parent.id){
                var object={};
                object.id =secondMenus[j].id;
                object.label = secondMenus[j].name;
                arr.push(object);
              }
            }
            option.children=arr;
            _this.options.push(option);
          }
        });
        _this.addVisible = true;
      },
      handleSelectionChange(val,index) {
        this.multipleSelection=val;
      },
      edit(){
        var selected= this.multipleSelection;
        if (selected.length!=1){
          this.$message.warning("请选择一条数据进行编辑");
          return;
        }
        var id=selected[0].id;
        var _this=this;
        _this.$axios.get(_this.$base_url+_this.editUrl+"?id="+id).then(result=>{
          const menuData=result.data.data;
          const secondMenus=menuData.secondMenus;
          const topMenus=menuData.topMenus;
          _this.options.shift();
          for (var i=0;i<topMenus.length;i++){
            var option={};
            option.id=topMenus[i].id;
            option.label = topMenus[i].name;
            var arr= new Array();
            for (var j=0;j<secondMenus.length;j++){
              if (topMenus[i].id==secondMenus[j].parent.id){
                var object={};
                object.id =secondMenus[j].id;
                object.label = secondMenus[j].name;
                arr.push(object);
              }
            }
            option.children=arr;
            _this.options.push(option);
          }
          var currentMenu=menuData.menus[0];
          _this.form.id=currentMenu.id;
          _this.form.name = currentMenu.name;
          if (currentMenu.parent==null ||currentMenu.parent==""){
            _this.form.parentId=null;
            _this.value=currentMenu.id;
          } else{
            _this.form.parentId=currentMenu.parent.id;
            _this.value=currentMenu.parent.id;
          }
          _this.form.url=currentMenu.url;
          _this.form.icon =currentMenu.icon;
          _this.form.sort=currentMenu.sort;
          if (currentMenu.button==true){
            _this.form.isButton="1";
          } else{
            _this.form.isButton="2";
          }
          if (currentMenu.show==true){
            _this.form.isShow="1";
          } else{
            _this.form.isShow="2";
          }
          _this.editVisible=true;
        }).catch(err=>{
          console.log(err);
        });
      },
      deletes(){
          var _that=this;
        var selected= this.multipleSelection;
        if(selected.length!=1){
          this.$message.warning("请选择一条数据进行删除");
          return;
        }
        var id=selected[0].id;
        _that.$axios.post(_that.$base_url+_that.deleteUrl+"/"+id).then(result=>{
         const res= result.data;
           if (res.code==0){
             this.$message.success("菜单删除成功");
             _that.$router.go(0);
           }else{
             this.$message.error(res.msg);
           }
        }).catch(err => {
          // 你的逻辑
          this.$message.error("网络错误");
        });
      },
      addgsForm(){
        this.dialogAddgsVisible = true;
        let thit = this
        thit.$axios.get("/static/icon.json").then(res => {
          thit.icon =res.data.icon;
        });
      }, closeDialogAddgsVisible(){
        this.dialogAddgsVisible=false;
      },
      selectIcon(e){
        const s=e;
        this.form.icon=s.currentTarget.className;
        this.dialogAddgsVisible=false;
      },
      submitForm(formName,type) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            const that=this;
            const parent=that.form.parentId;
            if (parent==""){
              that.$message("请选择上级分类");
              return;
            }
            if (that.form.isButton=="1"){
              that.form.button=true;
            } else{
              that.form.button=false;
            }
            if (that.form.isShow=="1"){
              that.form.show=true;
            } else{
              that.form.show=false;
            }
            if (type =="add"){
              that.$axios.post(that.$base_url+that.addUrl,that.form).then(result =>{
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
            }else{
              //表示编辑
              if (that.form.isButton=="1"){
                that.form.button=true;
              } else{
                that.form.button=false;
              }
              if (that.form.isShow=="1"){
                that.form.show=true;
              } else{
                that.form.show=false;
              }
              that.$axios.post(that.$base_url+that.editUrl,that.form).then(result =>{
                if (result.data.code==0){
                  //表示成功
                  this.$message({
                    message: '编辑成功',
                    type: 'success'
                  });
                  this.$router.go(0);
                }else{
                  this.$message.error(result.data.msg);
                }
              });
            }
          } else {
            console.log('error submit!!');
            return false;
          }
        });
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
