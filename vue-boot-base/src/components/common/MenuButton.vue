<template>
  <div >
    <div >
      <div class="menu-button" v-for="menu in buttonData">
        <el-button
          type="primary"
          :icon="menu.icon"
          class="handle-del mr10"
          v-if="menu.name=='添加'" @click="add(menu.url)"
        >
          {{menu.name}}
        </el-button>
        <el-button
          type="primary"
          :icon="menu.icon"
          class="handle-del mr10"
          v-else-if="menu.name=='编辑'"  @click="edit(menu.url)"
        >
          {{menu.name}}
        </el-button>
        <el-button
          type="primary"
          :icon="menu.icon"
          class="handle-del mr10"
          v-else="menu.name=='删除'" @click="deletes(menu.url)"
        >
          {{menu.name}}
        </el-button>
      </div>
    </div>

  </div>
</template>
<script>
  export default {
    data() {
      return {
        query: {
          username: '',
          currentPage: 1,
          pageSize: 2
        },
        buttonData:{
          name:'',
          url:''
        }
      };
    },
    computed: {},
    components: {

    },
    methods: {
      add(e) {
        const _that=this;
        _that.$parent.addUrl=e;
        _that.$parent.add();
      },
      edit(e) {
        const _that=this;
        _that.$parent.editUrl=e;
        _that.$parent.edit();
      },
      deletes(e){
        const _this=this;
        _this.$parent.deleteUrl=e;
        _this.$parent.deletes();
      },
      handleSearch(){
        const _this=this;
        _this.$emit('query-name',_this.query.username);
        _this.$parent.handleSearch();
      },
    },
    created(){
    var _this=this;
    var url=_this.$parent.menuUrl;
      _this.$axios.get(_this.$base_url+"home/index/get_menu_button?url="+url).then(result=>{
        const menuButton=result.data.data;
        _this.buttonData=menuButton;
      });
    }
  }
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

.menu-button{
  float: left;
  }
</style>
