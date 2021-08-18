<template>
  <div>

    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-lx-calendar"></i> 菜单管理
        </el-breadcrumb-item>
        <el-breadcrumb-item>编辑菜单</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="form-box">
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
            <el-input-number v-model="form.sort"  placeholder="请输入排序" :min="1" :max="10"  label="排序"></el-input-number>
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
          <el-form-item>
            <el-button type="primary" @click="submitForm('form')">立即创建</el-button>
            <el-button @click="resetForm('form')">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
    <el-dialog :title="title" :visible.sync="dialogAddgsVisible"  @close="closeDialogAddgsVisible">
      <ul>
        <li class="icon-li" v-for="(item,index) in icon" :key="'icon'+index">
          <div data-v-78dfadcd="" class="icon-li-content">
            <i data-v-78dfadcd="":class="`${item}`" @click="selectIcon"></i>
            <span data-v-78dfadcd="">{{item}}</span>
          </div>
        </li>
      </ul>
    </el-dialog>
  </div>

</template>
<script>
  import Treeselect from '@riophae/vue-treeselect'
  import '@riophae/vue-treeselect/dist/vue-treeselect.css'
  export default {
    name:"testTreeSelect",
    components: {
      Treeselect
    },
    data() {
      return {
        form: {
          id:'',
          name: '',
          parentId: null,
          url: '',
          icon: '',
          sort: '0',
          isButton: '1',
          isShow: '1'
        },
        value: 2,
        options: [ {
          id:'a',
          label: 'a',
          children: [ {
            id: 'b',
            label:'b',
          }],
        } ],
        rules: {
          name: [
            { required: true, message: '请填写菜单名称', trigger: 'blur' },
            { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
          ]
        },
        title:"",
        showModal:false,
        dialogAddgsVisible:false,
        icon:[],
      };
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            const that=this;
            that.$axios.post(that.$base_url+'/admin/menu/edit',that.form).then(result =>{
              if (result.data.code==0){
                //表示成功
                this.$message({
                  message: '编辑成功',
                  type: 'success'
                });
                this.$router.push({ path: "/menu"});
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
      selectIcon(e){
        const s=e;
        this.form.icon=s.currentTarget.className;
        this.dialogAddgsVisible=false;
      }
    },
    created(){
      var id=this.$route.query.id;
      const _this=this;
      _this.$axios.post(_this.$base_url+'admin/menu/menu_edit/'+id).then(result => {
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
        _this.form.parentId=currentMenu.parent.id;
        _this.value=currentMenu.parent.id;
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
